# RStudio, setup proj,  git -----------------------------------------------
#' DONE
#' Sections: cmd + mayus + r
#' <- : opt + -
#' Ejecutar: cmd + intro, opt + intro
#' Borrar fila: cmd + d
#' Mover fila: option + arriba/abajo


# R basics I : vectors,  lists,  matrices,  data.frames -------------------

a <- 5
a <- c(5)
b <- 3
print("Holi")

# estas tres cosas son equivalentes
var = "valor"
var
var <- "valor"
var
"valor" -> var
var

# Seq ~ range en python
nmrs <- seq(from = 4, 40, 2)
seq(40)
1:40

# c
# vectors ~ tupla en python
primer_vector <- c(5, 1, 4, 6, 2, 8, 9)
primer_vector
segundo_vector <- c(4, 6, 2, 4, 4, 9, 8)
primer_vector + segundo_vector
# Todas las operaciones/funciones estan vectorizadas!!!

primer_vector + 6
primer_vector + c(6, 2)

tercer_v <- c(2, 3, 4, 5, 6, 7)
tercer_v + c(6, 2)
# RECICLAJEEEEEEEEE!!

vtor_letras <- letters[1:6]
paste(vtor_letras, LETTERS[1:6])
paste(vtor_letras, "A")
paste(vtor_letras, LETTERS[1:3])
paste(vtor_letras, LETTERS[1:5])
paste(vtor_letras, LETTERS[1:5], sep = " - ")
# "a - A" "b - B" "c - C" "d - D" "e - E" "f - A"


# basic functions
primer_vector
sum(primer_vector)
mean(primer_vector)
median(primer_vector)
min(primer_vector)
max(primer_vector)
length(primer_vector)

segundo_vector <- c(segundo_vector, -3, -5)
abs(segundo_vector)


# slicing
primer_vector[2:5]
primer_vector[c(3, 5, 6)] # subsetting
primer_vector[c(T, F, F, T, T, T, F)]
rbind(primer_vector, c(T, F, F, T, T, T, F))

# coercion / en un vector todos los elementos son del mismo tipo
c(1, "av")
c(T, F, 3)

# LISTAS
list(1, "av")
my_list <- list(c(1, 3), letters[1:3], 100:140)

# slicing de listas
my_list[2] # Esto es una lista!!!
my_list[1:2]

# acceder al objeto guardaado en la lista
my_list[[2]] # Esto es un vector!!
my_list[[2]]

my_named_list <- list(a = 1:4, b = letters[1:5], cosa = "holi")
my_named_list

# Estzs tres cosas son equivalentes
my_named_list$cosa
my_named_list[[3]]
my_named_list[["cosa"]]

# Matrices
m <- matrix(1:12, nrow = 3, ncol = 4, byrow = T)
m
m[3, 3]
m[1:2, ]
m[, 1:2]

# Dataframes
my_1st_df <- data.frame(a = letters[1:3], b = 2:4, c = c(T, F, T))
my_1st_df
my_1st_df$a # como my_1st_df.a en pandas

df <- data.frame(a = letters[1:3], b = 2:4, c = c(T, F, T, F))
# Error!
# Un data.frame es una lista en la que todos los elementos tienen la misma longitud

df <- data.frame(a = letters[1:4], b = 2:5, c = c(T, F, T, F))

# Seleccionar columnas
df$b
df[, c("a", "c")]
names(df)
df[, 1:3]
df[, c(2, 3)]
cols_to_sel <- c("a", "c")
df[, cols_to_sel]

# Seleccionar filas
df[1, ]
df[1:2, ]
df[c(1, 3), ]
df[c(T, F, F, T), ] 

# ... by value
df$b
df$b < 4
df[df$b < 4, ] # <<<<<<<<<<=========== IMPORTANTE!!


# R basics II: *apply functions -------------------------------------------
data("mtcars")
df <- mtcars
names(df)
#  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear" "carb"
df[df$hp > 100,]
df[df$drat > 2.5 & df$drat < 3.5,]
df[df$drat > 4 | df$carb == 4,]
df$drat > 4 | df$carb == 4

# Logical operators
# >, >=, <, <=, ==, !=
# &, |

#  Sel. filas                  Sel. columnas
df[df$drat > 4 | df$carb == 4, c("mpg", "cyl", "hp")]

# *apply
df
mean(df$hp)
apply(X = df, MARGIN = 2, FUN = mean) # MARGIN: 1 = filas, 2 = columnas
# Nota: el resultado es un vector con nombres
# named_vector <- c(a = 2, nombre2 = 45)

my_first_function <- function(x) {
  mean(x) + 2
}
apply(X = df, MARGIN = 2, FUN = my_first_function) 

my_second_function <- function(x) {
  x * 2
}
apply(X = df, MARGIN = 2, FUN = my_second_function) 

my_second_function <- function(x, n) {
  x * n
}
my_second_function(x = c(4, 5), n = 3)
# apply(X = df, MARGIN = 2, FUN = my_second_function(n = 3)) # NOP
apply(X = df, MARGIN = 2, FUN = my_second_function, n = 3) 
apply
# my_second_function(df$mpg, n = 3)
# my_second_function(df$cyl, n = 3)
# my_second_function(df$hp, n = 3)
# my_second_function(df$hp, n = 3)
apply(X = df[, c("mpg", "cyl")], MARGIN = 2, FUN = my_second_function, n = 3) 


# data.table --------------------------------------------------------------
# install.packages("data.table")
library(data.table) # library es equivalente a import en python

dt <- as.data.table(df, keep.rownames = T)
dt
df$new_col <- 1:32
dt[, new_col := 1:32]

# Borrar cols
dt[, new_col := NULL]

df[, mpg] # error!
dt[, mpg]
dt[, mpg + disp]
df$mpg + df$disp
dt[, .(hp, drat, new_var = mpg + disp)] # Sin asignacion
dt[, new_col := 1:32] # con asignacion
sub_dt <- dt[, .(rn, cyl, mpg7 = mpg * 7)]
# rm(sub_dt)
# sub_dt
dt[mpg>30]

# Estructura de una dt
dt[i, j, by]# i: filas, j: cols, by

dt[, unique(gear)]
dt[, .(mpg_m = mean(mpg)), by = gear]
dt[gear==4, mean(mpg)]

dt[, .(mpg_m = mean(mpg)), by = gear][mpg_m>20]

unique(dt[, .(gear, carb)])
dt[, .(mpg_m = mean(mpg)), by = .(gear, carb)]

# Special symbols
# .N
dt[, .N]
dt[, .N, by = gear]
dt[, .N, by = .(gear, carb)]
dt[, .N, by = list(gear, carb)]
# .SD
dt[, .SD, .SDcols = c("mpg", "cyl")]
col_names <- c("mpg", "cyl")
dt[, .SD, .SDcols = col_names]

# Merges
dt_ext <- data.table(cyl = c(4, 6, 8), new_col = c("a", "b", "c"))
dt_ext
dt[, .N, by = cyl]
merge(dt, dt_ext, by="cyl", all.x = T)

# Left join
dt_ext <- data.table(cyl = c(4, 6), new_col = c("a", "b"))
merge(dt, dt_ext, by="cyl", all.x = T)

# Right join
dt_ext <- data.table(cyl = c(4, 6, 8, 10), new_col = c("a", "b", "c", "d"))
merge(dt, dt_ext, by="cyl", all.y = T)

# Outer join
dt_ext <- data.table(cyl = c(6, 8, 10), new_col = c("b", "c", "d"))
dt_nas <- merge(dt, dt_ext, by="cyl", all = T)

# Inner join
dt_ext <- data.table(cyl = c(6, 8, 10), new_col = c("b", "c", "d"))
merge(dt, dt_ext, by="cyl", all = F)


# Dropna equivalent -------------------------------------------------------
dt_nas
is.na(c(2, NA, 5, 6))
# Como coger filas SIN na en new_col
dt_nas[!(is.na(new_col))]
is.na(dt_nas$new_col)

complete.cases(dt_nas)
dt_nas[ complete.cases(dt_nas) ]



# Export/Import stuff -----------------------------------------------------
write.csv(dt_nas, "data/dt_nas.csv")
fwrite(dt_nas, "data/dt_nas.csv") # equivalentes
saveRDS(dt_nas, "data/dt_nas.RDS") # sistema de archivos de R
# saveRDS(a, "data/a.RDS")

df_from_csv_base <- read.csv("data/one-star-michelin-restaurants.csv")
dt_from_csv_dt <- fread("data/one-star-michelin-restaurants.csv")
dt_nas <- readRDS("data/dt_nas.RDS")
# a <- readRDS("data/a.RDS")
# , encoding = "Latin-1" para datos no en ingles
# , dec = "," para datos no en ingles
# usar write.csv2 / read.csv2 para cosas no en ingles


# Regex en R --------------------------------------------------------------
grep(pattern = "\\bo.+ ",
     x = c("The same operation is done with Data.table as follows:",
           "As we see from the examples"),
     value = T)
gsub(pattern = "same", replacement = "SAME",
     x = "The same operation is done with Data.table as follows:")

library(stringr)

#' Usando grep para subsetear tablas
#' grep() dice los indices donde hay match
#' grpl() vector de T/F con T donde hay match
#' 
#' Cualquiera de los dos se lo pasamos a la i de la dt

dt$rn
grepl("Merc", dt$rn)
dt[grepl("Merc", rn)]

grep("Merc", dt$rn)
dt[grep("Merc", rn)]

# Usando %in%
sel_models <- c("Chrysler Imperial", "Fiat 128", "Honda Civic")
dt$rn %in% sel_models
dt[rn %in% sel_models]
dt[!(rn %in% sel_models)]

`%notin%` <- function (x, y) 
{
  !(x %in% y)
}

dt[rn %notin% sel_models]

#' Subseteando cols usando regex y sin usar grep
#' En su lugar usamos %like% o patterns()
dt[, .SD, .SDcols = names(dt) %like% "^d"]
dt[, .SD, .SDcols = patterns("^d")]



# Tidyverse ---------------------------------------------------------------
library(tidyverse)
# dplyr::between()
# data.table::between()
# Cuidado con las funciones que estan en varias librerias, no cargar a lo locooo

# purrrrr
dt[, bool_var := rep(c(T, F), 16)]
map(.x = dt, .f = is.logical)

# dplyr
# data.frame
df[df$mpg > 20]

# data.table:
dt[mpg > 20]

# tidyverse
filter(dt, mpg > 20)
dt %>%
  filter(mpg > 20) %>% 
  filter(cyl==4)

# dt %>%
#   filter(mpg > 20 & cyl == 4)
# no tidy, marie kondo doesn't approve

dt[
  mpg > 20 ][
  cyl == 4
]

# ggplot2
library(ggplot2)
data("mtcars")
dt <- as.data.table(mtcars)

dt[, cyl2 := as.character(cyl)]
ggplot(data = dt,
       mapping = aes(x = mpg, y = qsec, color = cyl2)) +
  # geom_line()
  geom_point() 
# ggsave("puntitos.jpg")



# Dates -------------------------------------------------------------------
as.Date("26/06/2021", format = "%d/%m/%Y")
library(zoo)
library(lubridate)

as.Date("26/06/2021", format = "%d/%m/%Y") %>% 
  zoo::as.yearmon()

as.Date("26/06/2021", format = "%d/%m/%Y") + 1



