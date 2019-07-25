################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 10                 ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################


## O presente tutorial foi desenvolvido para acompanhar a Aula 10 do curso introdutório de Análise e Visualização de dados (PPgEL/UFRN). Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente. 

## Carregando pacotes
library(dplyr)
library(ggplot2)


## Construindo dataset de Winter (2015)
pitch = c(233,204,242,130,112,142)
sex = c(rep("female",3),rep("male",3))
my.df = data.frame(sex,pitch)

my.df


## Construindo um modelo linear

xmdl = lm(pitch ~ sex, my.df)

## Vendo o resultado de um modelo linear através de uma tabela ANOVA
anova(xmdl)



## Vendo os resultados de um modelo linear

summary(xmdl)

## Vendo os objetos de um modelo linear

names(summary(xmdl))

## Requisitando objetos específicos dentre os resultados de um modelo linear

summary(xmdl)$call

summary(xmdl)$r.squared

summary(xmdl)$adj.r.squared

summary(xmdl)$coefficients


## Média da variável dependente por grupo de my.df
my.df%>%
 group_by(sex)%>%
 summarise(media = mean(pitch))



## Construindo segundo dataset de Winter(2015)
age = c(14,23,35,48,52,67)
pitch = c(252,244,240,233,212,204)
my.df = data.frame(age,pitch)

my.df

## Gráfico de dispersão pitch ~ idade
ggplot(my.df, aes(age, pitch))+
  geom_point(size = 3)+
  geom_smooth(method = "lm", se = F, color = "black")+
  labs(x = "idade (em anos)", y = "pitch (hz)")+
  theme_classic()


## Construindo um modelo linear para pitch ~ idade e vendo seus resultados

xmdl = lm(pitch ~ age, my.df)
summary(xmdl)

## Você pode seguir o link abaixo para inspecionar de forma interativa como uma regressão linear funciona

## http://shiny.estatistica.ccet.ufrn.br/regressao-linear-interativa/


# Vamos praticar

## Problema

#O conjunto de dados diamonds.csv traz o o valor de venda de 150 diamantes, bem como peso e índice de claridade de cada diamante. Importe o conjunto de dados chamando seu novo dataframe de "diamonds".


#Faça um modelo linear para averiguar se o valor de venda de um diamante muda em função do seu peso.

# Tente interpretar não só o resultado sobre a rejeição ou não da $H_0$, mas os coeficientes do modelo.











## Continuando...

## Vamos adicionar a variável claridade para interpretar a dispersão dos dados

ggplot(diamonds, aes(x = weight, y = value, color = clarity))+
  geom_point(size = 3)+
  theme_bw()



## Vamos ajustar um modelo linear levando em consideração as duas variáveis independentes. Como fica a sintaxe?

modelo.peso.claridade = lm(value ~ ??????????, diamonds)


summary(modelo.peso.claridade)

###################################
### Um pouco mais de informação ###
###################################


##Vamos lembrar as idades que há no nosso dataframe de pitch ~ idade
age

## Vamos buscar os valores previstos pelo modelo
xmdl$fitted

## Vamos lembrar o pitch dos participantes do nosso dataframe de pitch ~ idade
pitch

## Vamos buscar os valores residuais do modelo
xmdl$residuals

##############
## REVISÃO  ##
##############

## A função `lm()` ajusta um modelo linear de uma variável dependente y em função de uma variável independente y. Primeiro criamos o modelo, depois extraímos o sumário dos resultados. É possível vermos os objetos do sumário com `names()`

## modelo <- lm(x ~ y, data)

## summary(modelo)

## names(summary(modelo))


## É possível recuperar os valores previstos por um modelo e os seus resíduos (para testar sua normalidade) indicando isso com um `$`.
 
## modelo$fitted # recupera valores previstos pelo modelo
## modelo$residuals #recupera os resíduos do modelo

