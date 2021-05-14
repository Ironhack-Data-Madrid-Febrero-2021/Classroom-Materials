import pandas as pd


def carga_data():
    data = pd.read_csv("data/clean.csv")
    return data

