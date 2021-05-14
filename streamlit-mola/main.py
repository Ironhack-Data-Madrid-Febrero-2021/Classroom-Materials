import streamlit as st
from PIL import Image
import pandas as pd
import src.manage_data as dat

imagen = Image.open("images/portada2.jpg")

st.image(imagen)


st.write("""
# Mi súper app 
Con Jake el perro y Finn el humano lo pasaremos guay 🚀
""")

datos = dat.carga_data()

st.dataframe(datos)