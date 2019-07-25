################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 13                 ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################


## O presente tutorial foi desenvolvido para acompanhar a Aula 13 do curso introdutório de Análise e Visualização de dados. Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

## Carregando pacotes
library(dplyr)
library(ggplot2)

## Importar o conjunto de dados

labov = read.csv("labov.csv")


##Lembrando os números das distribuições por loja
tabela.lojas = table(labov$r, labov$store)
tabela.lojas

## Ajustando um modelo linear generalizado do tipo regressão logística

labov.loja = glm(r ~ store, labov, family = binomial)


##Analisando os dados

summary(labov.loja)

## Vendo os coeficientes
summary(labov.loja)$coef


##Consultando os níveis da variável dependente

levels(labov$r)


##Calculando os logodds da odds ratio
log(21/195)

##Vendo a odds ratio a partir das logodds

exp(-2.228477)

exp(1.704933)

exp(2.1385293)


## Pacote para análises post-hoc de modelos lineares (incluindo modelos de regressão logística)

install.packages("emmeans")
library(emmeans)


## análise post-hoc do modelo ajustado
glm.labov.loja = emmeans(labov.loja, ~ store)

pairs(glm.labov.loja, adjust="tukey")

###############
### PRÁTICA ###
###############

## Godoy, Weissheimer & Mafra (submetido) testaram se a representação de um evento de transferência de posse influenciava o modo como as pessoas interpretavam um pronome ambíguo.

#Para isso, eles pediram para as pessoas completarem sentenças como as que você abaixo, que continham três tipos de verbos de transferência de posse:


#João entregou a maçã para Mário . Ele… (verbo de Classe 1)
#
#Pedro jogou a chave para Roberto. Ele… (verbo de Classe 2)
#
#Sulei transferiu dinheiro para Maria. Ela… (verbo de Classe 3)

#As respostas foram analisadas para ver se os participantes interpretaram o pronome como co-referente à fonte ou ao alvo do evento.

#### VARIÁVEL PREDIOTRA ####

#Os verbos de Classe 1, 2 e 3 tinham as seguintes características:

##Verbos de classe 1: participantes necessariamente na mesma cena do evento; garantia de transferência

##Verbos de classe 2: participantes necessariamente na mesma cena do evento; sem garantia de transferência

##Verbos de classe 3: participantes não estão necessariamente na mesma cena do evento; sem garantia de transferência

#### HIPÓTESES ####

#Os autores imaginavam que pronomes em contextos de verbo do Tipo 3 teriam menor preferência por serem interpretados como co-referentes ao referente ocupando papel temático de alvo, pois ele estaria em menor evidência em comparação aos tipos 1 e 2, visto que não há necessidade de ele estar na cena do evento descrito pelo verbo.

#Em contexto de verbos do tipo 1, haveria maior preferência por interpretar o pronome como co-referente ao alvo, pois a transferência é bem sucedida.

#### TAREFAS ####

##Filtre os dados da tabela “godoy_et_al.xlsx” para considerar apenas os dados com “source” (fonte) ou “goal” (alvo); não nos interessam os dados em que a interpretação foi ambígua.

##Faça um gráfico para averiguar a distribuição de fonte/alvo por tipo de verbo.

##Faça um qui-quadrado para ver se houve efeito de tipo de verbo.

##Faça uma regressão logística para ver se houve efeito do tipo de verbo e como foi esse efeito.

#Tente entender o que os valores dos coeficientes querem dizer.






#############
## REVISÃO ##
#############


## modelo = glm(var_dependente ~ var_independente, dados, family = binomial)
## 
## glm.model = emmeans(modelo, ~ var_independente)
## pairs(glm.model, adjust="tukey")

