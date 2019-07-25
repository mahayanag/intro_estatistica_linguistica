################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 8                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 8 do curso introdutório de Análise e Visualização de dados. Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.
## Carregando pacotes
library(ggplot2)
library(yarrr)
library(tidyverse)
library(readxl)
library(car)


##Instale e carregue um novo pacote

install.packages("yarrr")
library(yarrr)

## Se não der, importe o conjunto de dados com read.csv

poopdeck = read.csv("poopdeck.csv")
 
str(poopdeck)

## Inspecione o conjunto de dados 
head(poopdeck)


##Boxplot dos dados (as cores por cleaner são dadas pelo comando aes(fill=cleaner))
  
ggplot(poopdeck,aes(x=type, y = time))+
  geom_boxplot(alpha = 0.8, aes(fill=cleaner), outlier.size = 2)+
  theme_bw()



##Mais boxplots

ggplot(poopdeck, aes(x=cleaner, y=time))+
  geom_boxplot(alpha = 0.8, aes(fill=cleaner), outlier.size = 2)+
  theme_bw()

#####################
### ONE-WAY ANOVA ###
#####################
## Fazemos uma anova com a função aov()
 
modelo.cleaner <- aov(time ~ cleaner, data = poopdeck)
 

## Recuperamos a tabela ANOVA com summary()
summary(modelo.cleaner)

## Fazemos análises post-hoc com TukeyHSD()
TukeyHSD(modelo.cleaner)

#####################
### TWO-WAY ANOVA ###
#####################

## Boxplot por type

ggplot(poopdeck, aes(x=type, y=time))+
  geom_boxplot(alpha = 0.8, aes(fill=type), outlier.size = 2)+
  theme_bw()


## Two-way ANOVA
 
modelo.cleaner.type <- aov(time ~ cleaner + type, data = poopdeck)

 summary(modelo.cleaner.type)



## Análise post-hoc
 
TukeyHSD(modelo.cleaner.type)
 
########################
### ESTUDO DE CASO 1 ###
########################


## Conduza uma ANOVA no conjunto Baumann e Jones

##Carregue o pacote que tem o conjunto de dados 
library(car)

##Inspecione o conjunto
Baumann

## Vamos ver o boxplot

ggplot(Baumann, aes(x=group, y=post.test.1))+
  geom_boxplot(alpha = 0.8, aes(fill=group), outlier.size = 2)+
  theme_bw()

##Faça uma análise em post-test 1 para ver se há efeito principal de técnica e reporte sua resposta como se você estivesse escrevendo um artigo.

###################################
### TWO-WAY ANOVA COM INTERAÇÃO ###
###################################


## O efeito do produto de limpeza depende do tipo de dejeto? Qual a fórmula?
  
ggplot(poopdeck,aes(x=type, y = time))+
  geom_boxplot(alpha = 0.8, aes(fill=cleaner), outlier.size = 2)+
  theme_bw()


## Primeiro nós fazemos um modelo, com a função aov para responder a pergunta que nos interessa.

modelo.cleaner.int.type <- aov(time ~ cleaner * type, data = poopdeck)


## Agora tiramos a nossa tabela desse modelo através da função summary
 
summary(modelo.cleaner.int.type)



## Mais uma vez, o teste de Tukey pode te dar as comparações em um teste post-hoc.

TukeyHSD(modelo.cleaner.int.type)

########################
### ESTUDO DE CASO 2 ###
########################

## Carregue o pacote Covariaveis.csv (Oushiro, 2015)
## 
covariaveis = read.csv("Covariaveis.csv")

## Há efeito de gênero na taxa de produção de concordância nominal não-padrão e será que esse efeito depende do nível de escolaridade?

## Vamos fazer uma filtragem para eliminar os falantes estrangeiros

covariaveis.br = covariaveis%>%
  filter(ORIGEM.PAIS != "estrangeiros")


## Vamos ver os dados

ggplot(covariaveis.br, aes(x=ESCOLARIDADE, y=CN))+
  geom_boxplot(alpha = 0.8, aes(fill=SEXO.GENERO), outlier.size = 2)+
  theme_bw()
  

## Para podermos fazer nossas análises, precisamos transformar os dados, visto que não são normais (cf. Aula 7).

## Alguns informantes tem valor igual a 0 na coluna CN, o que significa que ele não realizaou nenhuma CN não-padrão. Como é impossível fazer uma transformação logarítmica em 0, somamos 1 a todos os valores da coluna e, depois disso, realizamos a transformação.

covariaveis.br = covariaveis.br%>%
  mutate(CN.1 = CN+1)%>% 
  mutate(CN.log = log(CN.1))


## Vamos construir um modelo para uma análise Two-way ANOVA com interação e ver o resultado da Tabela ANOVA.

modelo.CN <- aov(CN.log ~ SEXO.GENERO * ESCOLARIDADE, data = covariaveis.br)

summary(modelo.CN)


## Como não houve efeito de interação, o Teste Tukey deve fazer as análises apenas para os termos que foram significantes para o modelo: SEXO.GENERO e ESCOLARIDADE.

TukeyHSD(modelo.CN, "SEXO.GENERO")

TukeyHSD(modelo.CN, "ESCOLARIDADE")

## Como nosso experimento é 2x2 e não houve efeito de interação, nem precisaríamos ter feito essa análise post-hoc!


###############
### REVISÃO ###
###############

## Funções para teste ANOVA

## modelo.aov <- aov(x ~ y, data)
## TukeyHSD(modelo.aov, "y")

