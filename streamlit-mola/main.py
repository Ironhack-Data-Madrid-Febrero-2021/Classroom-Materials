import streamlit as st
from PIL import Image
import src.manage_data as dat
import plotly.express as px

imagen = Image.open("images/portada2.jpg")

st.image(imagen)


st.write("""
# Mi súper app 
Con Jake el perro y Finn el humano lo pasaremos guay 🚀
""")

#dat es el alias y carga_data es la función
datos = dat.carga_data()

#st.dataframe visualiza un dataframe
st.dataframe(datos)

#datos_grafico llama a la función que genera el gráfico de barras
datos_grafico = dat.grafico_barras_st()
st.dataframe(datos_grafico)

st.bar_chart(datos_grafico)
lista = dat.lista_personajes()

personaje = st.selectbox("Selecciona algo de la lista", lista)
st.write("Has elegido", personaje)


datagraf = dat.grafico(personaje)

fig = px.line(datagraf, y="polarity", title=f"Evolución de la polaridad de  {personaje}")

st.plotly_chart(fig)
