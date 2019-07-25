################################################################################
########### Programa de P?s-gradua??o em Estudos da Linguagem (UFRN) ###########
########### An?lise e Visualiza??o de dados: Aula 4                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMA??ES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 4 do curso introdut?rio de An?lise e Visualiza??o de dados (PPgEL/UFRN - 2018). Por esse motivo, alguns dos comandos podem n?o ser t?o transparentes se forem realizados de forma independente. 

## Pacotes que usaremos
library(ggplot2)
library(readxl)
library(scales)


## Gere um vetor chamado "altura" que conter? 100 observa??es de alturas, com m?dia de 160cm e desvio-padr?o de 15.
altura = rnorm(100, 160, 15)

## Os comandos abaixo gerar?o um dataframe a partir desse vetor e um histograma das alturas

x = as.data.frame(altura)
ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequ?ncia absoluta")

## Faremos o mesmo, mas gerando um conjunto de 1000 observa??es
altura = rnorm(1000, 160, 15)

x = as.data.frame(altura)

ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequ?ncia absoluta")

## Agora com 10.000 observa??es
altura = rnorm(10000, 160, 15)

x = as.data.frame(altura)

ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequ?ncia absoluta")

## Agora com 1.000.000 de observa??es (e dividiremos nossas bins por mil?metro, intervalor de 0.1 cm)
altura = rnorm(1000000, 160, 15)

x = as.data.frame(altura)

ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 0.1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequ?ncia absoluta")

## Voc? percebeu que indicamos a m?dia e o desvio padr?o para criar uma distribui??o normal no R? Isso ocorre porque esses s?o os ?nicos valores necess?rios para expressar matematicamente uma distribui??o que chamamos de DISTRIBUI??O NORMAL.

## Uma das caracter?sticas da distribui??o normal ? que m?dia, mediana e moda tem o mesmo valor, e a distribui??o de dados ? sim?trica.

#Com rela??o ? distribui??o de dados, ? poss?vel observar que em uma distribui??o normal:

#68% das observa??es est?o entre ?? + ?? e ?? - ??

#95% das observa??es est?o entre ?? + 2?? e ?? - 2??

## In?meras medidas dos fen?menos que estudamos parecem ter uma distribui??o normal. ? por isso que boa parte dos testes estat?sticos foram desenvolvidos para lidar com esse tipo de distribui??o.


#Com rela??o ? distribui??o de dados, ? poss?vel observar que em uma distribui??o normal:

#68% das observa??es est?o entre ?? + ?? e ?? - ??

#95% das observa??es est?o entre ?? + 2?? e ?? - 2??


###################
##### z-score #####
###################

#Uma jovem est? pensando em entrar para o time de atletismo de sua escola. Ela precisa escolher um esporte. Suas marcas s?o as seguintes:

# 61.20 segundos nos 400 metros

# 1.35 metros no salto em altura

# As m?dias do time da escola para esses esportes s?o

# 60s para os 400 metros
# 1.50m para o salto em altura

# Os desvios-padr?o  do time da escola para esses esportes s?o

# 3 para os 400 metros
# 0.15 para o salto em altura

## Vamos calcular o z-score da nossa aluna em rela??o ? distribui??o da turma.

observado.corrida = 61.2
media.corrida = 60
dp.corrida = 3

(observado.corrida - media.corrida)/dp.corrida

observado.salto = 1.35
media.salto = 1.5
dp.salto = 0.15

(observado.salto - media.salto)/dp.salto

# Quanto mais distante de 0 est? o z-score, mais distante da m?dia
# Seria melhor ela se inscrever nos 400m

# Conclus?o
# Eu consigo comparar valores de distribui??es diferentes se conseguir normaliz?-los de alguma forma.

# ? isso que o z-score faz.

#################################################
#### O z-score e a Distribui?? Normal Padr?o ####
#################################################

## O z-score ? bastante ?til pq ele nos permite calcular a probabilidade acumulada de um evento para a Distribui??o Normal Padr?o (DNP).

## A DNP ? uma distribui??o de m?dia 0 e desvio-padr?o 1. 

## Se transformarmos os valores de um conjunto de dados qualquer em seu z-score e plotarmos, teremos uma DNP!! (cf. slides) Isso facilita o c?lculo de probabilidades


########## ESTUDO DE CASO 1

## Qual a probabilidade de uma mulher ter at? 1,57 na amostra de 1.000.000 de alturas que plotamos no in?cio da aula?

media = 160
dp = 15
observado = 157

z.score = (observado - media)/dp

z.score

## Agora voc? pode procurar essa probabilidade na tabela da DNP (Cf. Hinton, Apendix A)


########## ESTUDO DE CASO 2

# Voc? participou de uma corrida de rua em que completou o percurso de 5km em 28 minutos. O tempo de corrida dos participantes apresenta uma distribui??o normal com m?dia de 32 minutos e desvio-padr?o de 3.5.

#Qual a probabilidade de algu?m ter feito um tempo menor que o seu?


#Qual a probabilidade de algu?m ter feito um tempo maior que o 


########## ESTUDO DE CASO 3

# Seu professor prometeu sortear um livro para os alunos que ficassem no top 10% da sala na prova final. A nota dos alunos apresentou uma distribui??o normal, com m?dia 6.5 e desvio-padr?o 2. Sua nota foi 8.2.

# Voc? est? entre os alunos que participar?o do sorteio?

#########################
### TESTE DE HIP?TESE ###
#########################

## Hip?tese de pesquisa: estudo intensivo aumenta a intelig?ncia (exemplo de Hinton)

## Medir intelig?ncia: teste de QI

## Problema: eu n?o tenho como sair testando todo mundo que fez estudo intensivo. O que eu posso fazer ? ver se as observa??es que eu tenho me permitem REJEITAR a hip?tese de que elas tem grande probabilidade de terem sa?do da distribui??o de QI para as pessoas em geral.

## H0 (ou hip?tese nula): n?o h? diferen?a entre as distribui??es

## ************* Quando eu fa?o um teste de hip?tese, eu calculo a probabilidade de rejeitar a hip?tese nula *************

# Peter quer mostrar que seu QI muito provavelmente N?O pertence ? popula??o normal, com m?dia de 100 e dp de 15 pontos.

## Peter faz um teste de QI e o resultado ? 120. Vamos calcular o z-score e a probabilidade de algu?m da popula??o comum ter um QI maior que o dele.

observado.qi = 120
media.qi = 100
dp.qi = 15

z.score.qi = (observado.qi - media.qi)/dp.qi

z.score.qi

pnorm(z.score.qi, lower.tail = F)

## A probabilidade de algu?m da popula??o normal ter um QI igual ou maior que o de Peter ? de 0.091.

## Quando fazemos um teste de hip?tese, estamos nos perguntando qual a probabilidade de rejeitarmos a Hip?tese Nula.

## Para isso, calculamos a probabilidade de um determinado valor ocorrer em um distribui??o.

## O z-score ? uma maneira de calcular essa probabilidade QUANDO A SUA DISTRIBUI??O ? NORMAL.

##################################
#### REVIS?O DE COMANDOS DO R ####
##################################

## Posso simular conjuntos de n dados distribu?dos em uma normal com a fun??o rnorm().

# a = rnorm(100, 80, 10) # n = 1000, m?dia = 80, desvio-padr?o = 10

## Para testar a probabilidade de um determinado z-score, podermos usar a fun??o pnorm() e indicar se o teste se repere ? upper tail ou lower tail.

# pnorm(z-score, lower.tail = F) #probabilidade acumulada a partir da upper tail
# pnorm(z-score, lower.tail = T) #probabilidade acumulada a partir da lower tail

