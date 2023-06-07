import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

r = 28
sigma = 10
beta = 8 / 3

def dx(f):
    return sigma * (f[1] - f[0])

def dy(f):
    return f[0] * (r - f[2]) - f[1]

def dz(f):
    return f[0] * f[1] - beta * f[2]

def runge_kutta(dx, dy, dz, f0, h, n):
    f = np.zeros((n + 1, 3))
    f[0] = f0

    for i in range(n):
        k1_1 = dx(f[i])
        k1_2 = dy(f[i])
        k1_3 = dz(f[i])

        k2_1 = dx(f[i] + (h / 2) * k1_1)
        k2_2 = dy(f[i] + (h / 2) * k1_2)
        k2_3 = dz(f[i] + (h / 2) * k1_3)

        k3_1 = dx(f[i] + (h / 2) * k2_1)
        k3_2 = dy(f[i] + (h / 2) * k2_2)
        k3_3 = dz(f[i] + (h / 2) * k2_3)

        k4_1 = dx(f[i] + h * k3_1)
        k4_2 = dy(f[i] + h * k3_2)
        k4_3 = dz(f[i] + h * k3_3)

        f[i + 1, 0] = f[i, 0] + (h / 6) * (k1_1 + 2 * k2_1 + 2 * k3_1 + k4_1)
        f[i + 1, 1] = f[i, 1] + (h / 6) * (k1_2 + 2 * k2_2 + 2 * k3_2 + k4_2)
        f[i + 1, 2] = f[i, 2] + (h / 6) * (k1_3 + 2 * k2_3 + 2 * k3_3 + k4_3)
    return f

def func(t, f):
    return [dx(f), dy(f), dz(f)]

if __name__ == '__main__':
    f0 = [0, 1, 20]

    h = 0.01
    n = 9999

    # Решение с помощью метода Рунге-Кутты
    f = runge_kutta(dx, dy, dz, f0, h, n)

    # Вычисление решения с помощью solve_ivp
    sol = solve_ivp(func, [0, 100], f0, method='RK45', dense_output=True)
    t_values = np.linspace(0, n * h, n + 1)
    f_solve_ivp = sol.sol(t_values).T

    plt.figure(figsize=(10, 6))
    plt.plot(t_values, f[:, 0], label='Runge-Kutta')
    plt.plot(t_values, f_solve_ivp[:, 0], label='solve_ivp')
    plt.xlabel('t')
    plt.ylabel('x')
    plt.legend()
    plt.title('Сравнение решений для x')
    plt.show()

    plt.figure(figsize=(10, 6))
    plt.plot(t_values, f[:, 1], label='Runge-Kutta')
    plt.plot(t_values, f_solve_ivp[:, 1], label='solve_ivp')
    plt.xlabel('t')
    plt.ylabel('y')
    plt.legend()
    plt.title('Сравнение решений для y')
    plt.show()

    plt.figure(figsize=(10, 6))
    plt.plot(t_values, f[:, 2], label='Runge-Kutta')
    plt.plot(t_values, f_solve_ivp[:, 2], label='solve_ivp')
    plt.xlabel('t')
    plt.ylabel('z')
    plt.legend()
    plt.title('Сравнение решений для z')
    plt.show()

