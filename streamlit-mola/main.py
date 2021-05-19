import streamlit as st
from PIL import Image
import src.manage_data as dat
import plotly.express as px
import pandas as pd
from streamlit_folium import folium_static
import folium
import codecs
import streamlit.components.v1 as components

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


st.write("""Formulario de texto""")
texto = st.text_input("Introduce un texto *", "Texto por defecto")
st.write("Ha introducido: ", texto)

st.write("Gestor de archivos")

fichero = st.file_uploader("Sube un CSV")

if fichero:
    st.dataframe(pd.read_csv(fichero))



foto = st.file_uploader("Sube una foto")

if foto:
    imagen = Image.open(foto)
    imagen.save("data/foto.png")
    st.write("Tu foto se ha subido correctamente")

st.write("Podemos hacer columnnas")

datitos = dat.bar_2()

col1, col2 = st.beta_columns([4,2])
col1.subheader("El gráfico")
col1.bar_chart(datitos)

col2.subheader("Los datitos")
col2.write(datitos)

st.write("""
Mapa de Folium
""")

mapa = folium.Map(location = [40.4143851,-3.6820241], zoom_start=15)
folium_static (mapa)

st.write("""
Integración de html 
""")

archivo = codecs.open("data/mapa.html", "r")
mapa = archivo.read()

components.html(mapa, height =  500)

st.write(dat.lista_type())
tipo = st.selectbox("Selecciona algo de la lista",dat.lista_type())

