import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

titanic = pd.read_csv("titanic.csv")

print(pd.pivot_table(titanic[["Survived", "Sex"]], index="Survived", columns="Sex", aggfunc=len))

# Фильтрация данных по выжившим и умершим
survived = titanic[titanic['Survived'] == 1]
not_survived = titanic[titanic['Survived'] == 0]

# Гистограмма по возрасту для выживших и умерших
sns.histplot(survived, x="Age", bins=50, label="Survived")
sns.histplot(not_survived, x="Age", bins=50, color='red', label="Not Survived")

plt.legend()
plt.show()