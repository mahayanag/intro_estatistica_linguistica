################################################################################
########### Programa de P�s-gradua��o em Estudos da Linguagem (UFRN) ###########
########### An�lise e Visualiza��o de dados: Aula 10                 ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMA��ES #####
######################


## O presente tutorial foi desenvolvido para acompanhar a Aula 10 do curso introdut�rio de An�lise e Visualiza��o de dados (PPgEL/UFRN). Por esse motivo, alguns dos comandos podem n�o ser t�o transparentes se forem realizados de forma independente.

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

## Vendo o resultado de um modelo linear atrav�s de uma tabela ANOVA
anova(xmdl)



## Vendo os resultados de um modelo linear

summary(xmdl)

## Vendo os objetos de um modelo linear

names(summary(xmdl))

## Requisitando objetos espec�ficos dentre os resultados de um modelo linear

summary(xmdl)$call

summary(xmdl)$r.squared

summary(xmdl)$adj.r.squared

summary(xmdl)$coefficients


## M�dia da vari�vel dependente por grupo de my.df
my.df%>%
  group_by(sex)%>%
  summarise(media = mean(pitch))



## Construindo segundo dataset de Winter(2015)
age = c(14,23,35,48,52,67)
pitch = c(252,244,240,233,212,204)
my.df = data.frame(age,pitch)

my.df

## Gr�fico de dispers�o pitch ~ idade
ggplot(my.df, aes(age, pitch))+
  geom_point(size = 3)+
  geom_smooth(method = "lm", se = F, color = "black")+
  labs(x = "idade (em anos)", y = "pitch (hz)")+
  theme_classic()


## Construindo um modelo linear para pitch ~ idade e vendo seus resultados

xmdl = lm(pitch ~ age, my.df)
summary(xmdl)

## Voc� pode seguir o link abaixo para inspecionar de forma interativa como uma regress�o linear funciona

## http://shiny.estatistica.ccet.ufrn.br/regressao-linear-interativa/


# Vamos praticar

## Problema

#O conjunto de dados diamonds.csv traz o o valor de venda de 150 diamantes, bem como peso e �ndice de claridade de cada diamante. Importe o conjunto de dados chamando seu novo dataframe de "diamonds".


#Fa�a um modelo linear para averiguar se o valor de venda de um diamante muda em fun��o do seu peso.

# Tente interpretar n�o s� o resultado sobre a rejei��o ou n�o da $H_0$, mas os coeficientes do modelo.











## Continuando...

## Vamos adicionar a vari�vel claridade para interpretar a dispers�o dos dados

ggplot(diamonds, aes(x = weight, y = value, color = clarity))+
  geom_point(size = 3)+
  theme_bw()



## Vamos ajustar um modelo linear levando em considera��o as duas vari�veis independentes. Como fica a sintaxe?

modelo.peso.claridade = lm(value ~ ??????????, diamonds)


summary(modelo.peso.claridade)

###################################
### Um pouco mais de informa��o ###
###################################


##Vamos lembrar as idades que h� no nosso dataframe de pitch ~ idade
age

## Vamos buscar os valores previstos pelo modelo
xmdl$fitted

## Vamos lembrar o pitch dos participantes do nosso dataframe de pitch ~ idade
pitch

## Vamos buscar os valores residuais do modelo
xmdl$residuals

##############
## REVIS�O  ##
##############

## A fun��o `lm()` ajusta um modelo linear de uma vari�vel dependente y em fun��o de uma vari�vel independente y. Primeiro criamos o modelo, depois extra�mos o sum�rio dos resultados. � poss�vel vermos os objetos do sum�rio com `names()`

## modelo <- lm(x ~ y, data)

## summary(modelo)

## names(summary(modelo))


## � poss�vel recuperar os valores previstos por um modelo e os seus res�duos (para testar sua normalidade) indicando isso com um `$`.

## modelo$fitted # recupera valores previstos pelo modelo
## modelo$residuals #recupera os res�duos do modelo

