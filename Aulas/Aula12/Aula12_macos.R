################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 12                 ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################


## O presente tutorial foi desenvolvido para acompanhar a Aula 12 do curso introdutório de Análise e Visualização de dados (PPgEL/UFRN). Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

## Carregando pacotes
library(ggplot2)

## Carregue o conjunto de dados que vimos na aula anterior

labov = read.csv("labov.csv")


## Dados da distribuição dos róticos
tabela = table(labov$r)
tabela
teste = chisq.test(tabela)

## Objetos presentes no teste
names(teste)

## Valor da estatística X2
teste$statistic

## Valor esperado e observado
teste$expected

teste$observed


## Tabela de róticos por loja e teste qui-quadrado

tabela.lojas = table(labov$r, labov$store)
tabela.lojas

chisq.test(tabela.lojas)


## Dados observados e esperados dos róticos por loja

teste.lojas = chisq.test(tabela.lojas)

teste.lojas$observed

teste.lojas$expected

## Calculando o valor de x2
O = teste.lojas$observed
E = teste.lojas$expected

x2 = sum((O-E)^2/E)
x2

## Conferindo o valor de x2 calculado

chisq.test(tabela.lojas)

## Dividir o valor de ocorrências da tabela por 20
tabela.lojas.20 = tabela.lojas/20
tabela.lojas.20

##Proporção continua a mesma

prop.table(tabela.lojas, 2)

prop.table(tabela.lojas.20, 2)

## Valor de x2 e p mudam, pois o n mudou
chisq.test(tabela.lojas)
chisq.test(tabela.lojas.20)


## Lembrando o gráfico de barras 

ggplot(labov, aes(x=r))+ ## contagem
  geom_bar()

## Gráfico de barras: porcentagem
ggplot(labov, aes(x=r))+
  geom_bar(aes( y = (..count..)/sum(..count..))) + ## probabilidade
  scale_y_continuous(labels=scales::percent) ##porcentagem

## Gráfico por lojas
ggplot(labov, aes(x = store)) +  
geom_bar(aes( y = (..count..)/sum(..count..))) +
scale_y_continuous(labels=scales::percent)+
labs(x = "Lojas", y = "Frequência de realização")


##Gráfico por lojas 2
ggplot(labov, aes(x=store))+ ## probabilidade
  geom_bar(aes(y = ..count../sum(..count..), fill=r))+
  scale_y_continuous(labels=scales::percent)+ ## porcentagem
  labs(y = "Frequência de realização", x = "Lojas")+
  theme_bw()

##Gráfico por lojas 3
ggplot(labov, aes(x = store, fill = r)) +  
  geom_bar(aes( y = (..count..)/sum(..count..)), position = "fill") +
  scale_y_continuous(labels=scales::percent)+
  labs(x = "Lojas", y = "Frequência de realização")+
  theme_bw()
