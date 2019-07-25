################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 9                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################


## O presente tutorial foi desenvolvido para acompanhar a Aula 9 do curso introdutório de Análise e Visualização de dados (PPgEL/UFRN - 2018). Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente. 

## Carregando pacotes
library(ggplot2)
library(readxl)

## Importe o conjunto de dados 
dados.study <- read_excel("studyhours_exammarks.xlsx")

## Abaixo, temos a sintaxe de um teste de correlação
## #cor.test(VARIÁVEL_1, VARIÁVEL_2)
## 

##No caso do conjunto de dados dados.study, preenchemos a sintaxe da seguinte maneira:
cor.test(dados.study$mark, dados.study$study.time)


## Importe o conjunto de dados de Oushiro 2017



## Veja se há correlação entre CN e CV3PP


##########################
## GRÁFICO DE DISPERSÃO ##
##########################

## Sintaxe básica
## ggplot(DATA, aes (x = PREDITORA, Y = RESPOSTA))

## Vamos tentar com nossos dados
ggplot(cov, aes (x = CN, y = CV3PP))+
  geom_point() ## geom_point indica o tipo de gráfico que queremos

## Vamos só deixar o gráfico mais bonito e ajustar uma linha de regressão.
ggplot(cov, aes (x = CN, y = CV3PP))+
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = "lm", se = FALSE)+
  theme_bw()

## Conferindo distribuição dos dados
boxplot(cov$CN, cov$CV3PP)


## Vamos fazer um teste de correlação de spearman
cor.test(cov$CN, cov$CV3PP, method = "spearman")


##### VARIÁVEIS DE CONFUNDIMENTO

## O gráfico abaixo mostra o efeito de ESCOLARIDADE na correlação; parece que essa variável não muda muito a correlação dos dados
ggplot(cov, aes (x = CN, y = CV3PP, colour = ESCOLARIDADE))+
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = "lm", se = FALSE)+
  theme_bw()


###### MÚLTIPLAS COMPARAÇÕES E ESTUDOS EXPLORATÓRIOS

## NÃO vamos usar os comandos em aula, mas vocês podem tentar fazê-lo em casa
## #install.packages("languageR")
## #library(languageR)


## pairscor.fnc( ~ cov$EN + cov$RT + cov$R0 + cov$CN + cov$CV3PP + cov$CV1PP, hist = T, smooth = T)


#######################
## ATIVIDADE PRÁTICA ##
#######################


## O conjunto de dados diamonds.csv tem uma coluna valuecom o valor de venda de 150 diamantes. Você acha que peso, claridade ou cor contribuem para o valor de venda de um diamante?

## Escolha um dos critérios, inspecione a distribuição e faça um teste de correlação com o valor de venda.

## Importe o conjunto de dados

## Veja se é possível explicar os dados por meio de uma correlação LINEAR

## Faça um teste que se ajuste aos dados

#############
## REVISÃO ##
#############


## Para fazer um teste de correlação (method = "spearman" se a distribuição não for normal)

## #cor.test(VARIÁVEL_1, VARIÁVEL_2)
## 

## Alguns comandos para ajustar gráficos de dispersão

## ggplot(DADOS, aes(x=Variável preditora, y=Variável resposta))+ # define os eixos x e y
##   geom_point(size = 3, color = "black")+ #define características das bolinhas
##   geom_smooth(method='lm', color = "lightgrey", se = FALSE)+ #define características da
##                                                             #linha de regressão; o método
##                                                             #'lm' indica uma linha reta;
##                                                             # se = FALSE diz que você não
##                                                             # quer a área do standard error
##                                                             # associada a essa linha
##   labs(x= "Medida eixo x", y = "Medida eixo y")+ #Legenda do eixo x e y
##   theme_bw() #indica o tema; bw é um tema blck and white, o fundo do gráfico fica branco

