################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 11                 ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################


## O presente tutorial foi desenvolvido para acompanhar a Aula 11 do curso introdutório de Análise e Visualização de dados. Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente. 

## Carregando pacotes
library(dplyr)
library(ggplot2)

## Qual a probabilidade de eu tirar 3 coroas em 3 lançamentos de moeda?
dbinom(3, 3, 0.5)


## Qual a probabilidade de eu tirar 1 coroas em 3 lançamentos de moeda?
dbinom(1, 3, 0.5)

## Qual a probabilidade de eu tirar ao menos 1 coroa em 3 lançamentos de moeda?
dbinom(1:3, 3, 0.5)

## Somando as probabilidades para 1, 2 ou 3 caras
sum(dbinom(1:3, 3, 0.5))



##Qual a probabilidade de eu tirar ao menos 90 coroas em 100 lançamentos de moeda?
sum(dbinom(90:100, 100, 0.5))



##Teste de Hipóteses: 

## H0: p(coroa) = 0.5
## HA: p(coroa) > 0.5 (HA é "greater") 
prop.test(90, 100, 0.5, alternative = "greater")

## PRÁTICA

## Dois sociolinguistas divergem sobre uma hipótese envolvendo os usos de “tu” e “você” para uma determinada população. O sociolinguista A acaba de publicar um paper afirmando que essas variantes ocorrem com igual frequência na língua dessa população. No entanto, o sociolinguista B diz que o contexto informal prevê o uso de “tu” em uma taxa maior do que “você”.

##O sociolinguista B, para provar seu ponto, coleta dados de situações informais de fala. Ao todo, ele contabiliza 132 ocorrências de “tu” e “você” somadas. Há 80 ocorrências de “tu” e 52 de “você”.

##Como testar se há evidências a favor da hipótese do sociolinguista B?

## Antes de fazer o teste, escreva a H0 e HA do Linguista B


########################
## TESTE QUI-QUADRADO ##
########################

## carregue o conjunto de dados
labov = read.csv("labov.csv")


## Primeira pergunta: No geral, as atendentes preferiram usar a forma de maior prestígio (r1) ou de menor prestígio; ou seja, será que p(r1) ≠ p(r0)?

## tabela de contingência (ou tabela de frequência absoluta)
tabela = table(labov$r)
tabela

## tabela de frequência relativa
prop.table(tabela)


## Gráfico de barras: contagem

ggplot(labov, aes(x=r))+ #não especificamos o eixo y, pois o default do r é entendê-lo como contagem
  geom_bar() ## especifica que o gráfico é um gráfico de barras! 


## Gráfico de barras: probabilidade
ggplot(labov, aes(x=r))+
  geom_bar(aes( y = (..count..)/sum(..count..))) ## Linha A

## Gráfico de barras: porcentagem
ggplot(labov, aes(x=r))+
  geom_bar(aes( y = (..count..)/sum(..count..)), fill = "lightblue", color = "black")+ #indico a cor do preenchimento da barra
  scale_y_continuous(labels=scales::percent)+ #Linha B
  labs(x = "Tipo de rótico realizado", y = "Contagem das realizações")+
  theme_bw()


## Teste de proporção dada H0 de que p(sucesso) = 0.5 e HA de que p(sucesso) ≠ 0.5
prop.test(499, 730, 0.5, alternative = "two.sided")

## Teste qui-quadrado
labov.r = chisq.test(tabela)
labov.r

## Tabela de frequência absoluta de tipo de rótico por ênfase

tabela.r.emphasis = table(labov$r, labov$emphasis)
tabela.r.emphasis

## Tabela de frequência relativa de tipo de rótico por ênfase: total das células soma 1

prop.r.emphasis = prop.table(tabela.r.emphasis)
prop.r.emphasis

## Tabela de frequência relativa de tipo de rótico por ênfase: colunas somam 1

prop.r.emphasis = prop.table(tabela.r.emphasis, 2)
prop.r.emphasis

## Teste qui-quadrado para testar de p(r1) é a mesma independente de emphasis

chisq.test(tabela.r.emphasis)

### PRÁTICA

## Agora que você já sabe como teste qui-quadrado funciona, teste a hipótese de Labov, descrita abaixo:

## O r realizado é de maior prestígio; portanto, a frequência de sua realização mudará em função da loja, visto que essas lojas atendem públicos de classes sociais distintas.







## REVISÃO

## Para testes com variável dependente que pode ser modelada por uma distribuição binomial

## prop.test(x, n, p) #testa a probabilidade de x ocorrências de sucesso em n lançamentos dada uma probabilidade p associada
## 
## table(dados$x) #tabela com os valores absolutos de cada nível da variável x
## 
## table(dados$x, dados$y) #tabela com os valores absolutos de cada nível da variável x para cada nível da variável y
## 
## prop.table(x) #tabela com as frequencias relativas dos valores de uma tabela x
## 
## chisq.test(x) #teste qui-quadrado para distribuição dos níveis da tabela x
## 



## FAZENDO GRÁFICOS DE BARRA

## ggplot(dados, aes(x=x))+ ## indica o eixo x
##   geom_bar(aes( y = (..count..)/sum(..count..)), fill = "cor")+ #indica em aes() o que a barra mostrará (aqui, identificando que é a probabilidade), e a cor do preenchimento da barra com a função fill =
##   scale_y_continuous(labels=scales::percent)+ #indica que o eixo y deve mostrar porcentagem
##   labs(x = "legenda", y = "legenda")+ #indica legenda dos eixos x e y
##   theme_bw() #indica o tema (aqui, o escolhido é bw - black/white)

