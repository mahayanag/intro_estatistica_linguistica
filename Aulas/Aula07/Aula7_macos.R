################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 7                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 7 do curso introdutório de Análise e Visualização de dados (PPgEL/UFRN - 2018). Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

setwd("~/Documents/Mahayana/academics/cursos/introstatistics/Aulas/Aula7/")

## Carregando pacotes
library(ggplot2)
library(tidyverse)
library(readxl)


##Importe o conjunto de dados que usaremos hoje
camara.sample = read.csv("camara_sample.csv")


##Explore os níveis de cada variável categórica com a função unique() 
 unique(camara.sample$subquota_description)
 unique(camara.sample$state)
 
##Crie o dataframe para a região Nordeste
 
camara.NE = camara.sample%>%
  filter(state == "RN" |state ==  "PE" |state ==  "BA" | state == "SE" |state ==  "AL" |state ==  "CE" | state == "PB" | state == "PI" |state ==  "MA")

##Faça o mesmo para as outras regiões. Use os nomes camara.SE, camara.N, camara.CO, camara.S.


##Crie o conjunto de dados para NE e SE dos dados de passagens aéreas ("Flight ticket issue"). Chame os conjuntos de NE.flight e SE.flight



##Faça um boxplot dos valores gastos nos subgrupos criados acima



##O histograma confirma a distribuição dos dados

hist(SE.flight$total_net_value)

hist(NE.flight$total_net_value)


##Faça um teste estatístico para avaliar se os deputados de ambas as regiões gastam o mesmo com passagens aéreas

## PERGUNTA 2:

# Será que deputados do NE gastam mais com passagens aéreas que deputados no NO?

# Crie os conjuntos de dados que forem necessários

# Faça os gráficos para ver a distribuição

# Realiza o teste estatístico necessário para responder à pergunta.


## PERGUNTA 3:

## Será que deputados do RN e da PB gastam o mesmo com refeições?

## Criando o conjunto de dados

RN.meal = camara.sample%>% 
  filter(subquota_description == "Congressperson meal", state == "RN")  

PB.meal = camara.sample%>% 
  filter(subquota_description == "Congressperson meal", state == "PB")

## Faça o boxplot, decida que teste usar para responder sua pergunta, faça o teste

boxplot(RN.meal$log.value, PB.meal$log.value)


##Transformando dados: A função mutate() do dplyr cria uma nova coluna com o nome e os valores especificados. Aqui, criamos a coluna log.value que receberá os valores da transformação logarítmica da coluna total_net_value

RN.meal = RN.meal%>%
  mutate(log.value = log(total_net_value))

PB.meal = PB.meal%>%
  mutate(log.value = log(total_net_value))

##Quando você rodar o código, verá que aparecerá uma nova coluna nos dataframse RN.meal e PB.meal descritos na área “Global Environment”.

## Podemos ver que os valores dessa nova coluna tem uma distribuição mais próxima a normal.

boxplot(RN.meal$log.value, PB.meal$log.value)

## Como os dados são normais, é possível rodar um teste-t

t.test(RN.meal$log.value, PB.meal$log.value, paired = F, alternative = "two.sided")


##Múltiplas comparações: como fazer todas as entre os valores gastos pelos deputados de cada estado com bilhetes aéreas.

## Criando o conjunto de dados
camara.meal = camara.sample%>%
  filter(subquota_description=="Flight ticket issue")

## Fazendo a análise par-a-par
pairwise.t.test(camara.flight$total_net_value, camara.flight$state, paired = F)


## PERGUNTA 4: Será que deputados do NE e da SE gastam o mesmo com refeições?

## Crie os conjuntos de dados (chame de NE.meal e SE.meal)

## Faça um boxplot


## Precisamos tirar alguns valores extremos

NE.meal = camara.NE%>%
  filter(subquota_description=="Congressperson meal", supplier != "VERDE VALE HOTEL S/A")


## Que distribuição é essa?

boxplot(NE.meal$total_net_value, SE.meal$total_net_value)


## Faça um teste estatístico adequado para esses dados e reporte seus resultados como se fosse um artigo

############
## GGPLOT ##
############

#Imagine que você queira fazer os boxplot de gastos de refeição por estado. Primeiro você cria o conjunto de dados:

camara.meal = camara.sample%>% 
  filter(subquota_description == "Congressperson meal")

## Agora você especifica que quer "state" no eixo x:

ggplot(camara.meal, aes(y=total_net_value, x = state))+
  geom_boxplot(outlier.size = 2, outlier.alpha = 0.3)



## Não temos como fazer o mesmo no histograma. Para isso, precisamos usar a função facet_wrap()

ggplot(camara.meal, aes(x=total_net_value))+
  geom_histogram()

ggplot(camara.meal, aes(x=total_net_value))+
  geom_histogram()+
  facet_wrap(~state)


############
## GGPLOT ##
############

## group_by(x) = agrupa os dados pelos níveis de x; summarize() = dá com output as medidas que vc pede como argumento da função
camara.sample%>%
  group_by(subquota_description)%>%
  summarize(media = mean(total_net_value))

## arrange() = especifica como está "arranjado" o output; aqui, queremos que o valor de media (especificado em summarize) seja apresentado em ordem decrescente

camara.sample%>%
  group_by(subquota_description)%>%
  summarize(media = mean(total_net_value))%>%
  arrange(desc(media))


## Qual é o deputado mais gastão?

camara.sample%>%
  group_by(congressperson_name)%>%
  summarize(media = mean(total_net_value))%>%
  arrange(desc(media))

####################
## TAREFA PRÁTICA ##
####################

##GRUPO 1: analise se há diferença entre os gastos dos deputados do NE e SE para participação em congresso (“Participation in course, talk or similar event”). Apresente um boxplot comparativo, decida que teste usar e reporte o resultado. Faça também um gráfico comparativo do gasto por estado para cada uma das regiões, para ver se os estados diferem muito entre si.

##GRUPO 2: analise se há diferença entre os gastos dos deputados do SE e S para aluguel de carros (“Automotive vehicle renting or charter”). Apresente um boxplot comparativo, decida que teste usar e reporte o resultado. Faça também um gráfico comparativo do gasto por estado para cada uma das regiões, para ver se os estados diferem muito entre si.