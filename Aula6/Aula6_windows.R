################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 6                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 6 do curso introdutório de Análise e Visualização de dados. Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

## Pacotes usados na aula

library(ggplot2)
library(tidyverse)
library(dplyr)
library(readxl)


## Gerando conjunto de dados para duas amostras 

A = rnorm(30, 200, 8) # gera o conjunto A, com 30 observações, média = 200, dp = 8
B = A # gera o conjunto B com os mesmos valores do conjunto A

mean(A)-mean(B) 

B = rnorm(30, 202, 8) # gera conjunto B, com 30 observações, média = 202, dp = 8

mean(A)-mean(B)

B = rnorm(30, 150, 8) # gera o conjunto B, com 30 observações, média = 150, dp = 8

mean(A)-mean(B)


## Para fins de ilustração, vamos simular duas amostras de Grupo A e Grupo B para nosso experimento sobre colesterol

sedentarios = rnorm(30, 200, sd = 15)
ativos = rnorm(30, 170, sd = 15)

## Com o comando abaixo, você faz um boxplot rápido dos grupos só para conferir se a distribuição dos dados é mesmo uma normal e para já dar uma olhada na diferença das médias.

boxplot(sedentarios, ativos)


## Com o comando abaixo, você faz um histograma rápido dos grupos só para conferir se a distribuição dos dados é mesmo uma normal e para já dar uma olhada na diferença das médias.

hist(sedentarios)

hist(ativos)


## Teste-t para comprar duas amostras não-pareadas; não há medidas repetidas

t.test(sedentarios, ativos, paired = FALSE, alternative = "greater")


## Teste-t para comprar duas amostras pareadas; não há medidas repetidas

t.test(sedentarios, ativos, paired = TRUE, alternative = "greater")

## Baumann e Jones coletaram dados para investigar a eficácia de dois novos métodos de ensino. Os alunos que participaram foram divididos aleatoriamente em três grupos de estudo: o primeiro grupo, receberia instrução normal (grupo `Basal`). O segundo, receberia instrução com o método codificado como `DRTA` e o terceiro com o método `STRAT`.

## Eles fizeram dois pré-testes (provas) com os participantes dos três grupos, para garantir que a diferença entre os grupos nesse primeiro estágio seria nula. Depois de os alunos terem aulas seguindo um dos três métodos, os autores fizeram três testes provas* para comparar se os grupos agora diferiam com relação à performance.

# Aqui, vamos apenas avaliar se as notas dos alunos na *Prova 1* são maiores entre os alunos que receberam ensino com o método `DRTA` em comparação aos alunos que receberam instrução com o método de ensino tradicional (`Basal`).

## Defina a área de trabalho para carregar o arquivo Baumann.xlsx

Baumann = read_excel("Baumann.xlsx")

## Inspecione o conjunto de dados

View(Baumann)
str(Baumann)

## Primeiro precisamos ver se nossa variável dependente preenche todos os requisitos para o teste-t, incluindo o critério de normalidade de distribuição dos dados

boxplot(Baumann$Basal, Baumann$DRTA)

## Os dados parecem normais. Portanto, realizo um teste-t *não-pareado* considerando o previsto em minhas hipóteses prévias.

t.test(Baumann$DRTA, Baumann$Basal, alternative = "greater", paired = FALSE)

## A tabela `Covariaveis.csv` (Oushiro, 2017) contém o dados de 128 falantes paulistanos. Importe a tabela e dê uma olhada nas variáveis com as funções `str()` ou `View()`.

# Use a função read.csv() para importar a tabela pois se trata de tabela em formato .csv

covariaveis = read.csv("Covariaveis.csv")

## Inspecione a tabela 

str(covariaveis)
View(covariaveis)


## Para fazer o teste a fim de determinar se escolaridade influencia nas taxas de CN, precisamos criar datasets separados para informantes com ensino superior e informantes para ensino médio. Hora de relembrar como se usa o dplyr!

ens.sup = covariaveis%>%
  filter(ESCOLARIDADE == "EnsSuperior")

ens.med = covariaveis%>%
  filter(ESCOLARIDADE == "EnsMedio")


## Vamos fazer um box plot para ver se os dados são normais.

boxplot(ens.sup$CN, ens.med$CN)


## Só para conferir com os histogramas

hist(ens.sup$CN)
hist(ens.med$CN)


## Fazendo um teste de Wilcoxon porque a distribuiçcão dos dados não é normal

wilcox.test(ens.med$CN, ens.sup$CN, alternative = "greater", paired = FALSE)

## Vamos apenas calcular a mediana (não a média!) para cada fator de escolaridade

covariaveis%>%
  group_by(ESCOLARIDADE)%>%
  summarise(mediana = median(CN))


################################
### REVISÃO DOS COMANDO NO R ###
################################

## Para fazer boxplots e histogramas rapidamente, use:

## hist(x) #histograma de x
## boxplot(x,y,z) #boxplot comparativo de x, y e z

## Para comparar dados independentes e numéricos, usem um teste-t para dados em uma distribuição normal e o teste de wilcoxon para dados que não tenham distribuição normal. 

## Não se esqueça de informar sua Ha em `alternative` e se os dados são pareados 

## t.test(x, y, paired = T/F, alternative = )
## wilcox.test(x, y, paired = T/F, alternative = )

