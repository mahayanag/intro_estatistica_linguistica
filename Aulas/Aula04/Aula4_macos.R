################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 4                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 4 do curso introdutório de Análise e Visualização de dados (PPgEL/UFRN - 2018). Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

## Pacotes que usaremos
library(ggplot2)
library(readxl)
library(scales)


## Gere um vetor chamado "altura" que conterá 100 observações de alturas, com média de 160cm e desvio-padrão de 15.
altura = rnorm(100, 160, 15)

## Os comandos abaixo gerarão um dataframe a partir desse vetor e um histograma das alturas

x = as.data.frame(altura)
ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequência absoluta")

## Faremos o mesmo, mas gerando um conjunto de 1000 observações
altura = rnorm(1000, 160, 15)

x = as.data.frame(altura)

ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequência absoluta")

## Agora com 10.000 observações
altura = rnorm(10000, 160, 15)

x = as.data.frame(altura)

ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequência absoluta")

## Agora com 1.000.000 de observações (e dividiremos nossas bins por milímetro, intervalor de 0.1 cm)
altura = rnorm(1000000, 160, 15)

x = as.data.frame(altura)

ggplot(data=x, aes(x=x))+
  geom_histogram(breaks=seq(110, 210, by = 0.1))+
  scale_x_continuous(breaks=pretty_breaks(n=10))+
  labs(x="Altura (em cm) de mulheres", y = "frequência absoluta")

## Você percebeu que indicamos a média e o desvio padrão para criar uma distribuição normal no R? Isso ocorre porque esses são os únicos valores necessários para expressar matematicamente uma distribuição que chamamos de DISTRIBUIÇÃO NORMAL.

## Uma das características da distribuição normal é que média, mediana e moda tem o mesmo valor, e a distribuição de dados é simétrica.

#Com relação à distribuição de dados, é possível observar que em uma distribuição normal:
  
#68% das observações estão entre μ + σ e μ - σ

#95% das observações estão entre μ + 2σ e μ - 2σ

## Inúmeras medidas dos fenômenos que estudamos parecem ter uma distribuição normal. É por isso que boa parte dos testes estatísticos foram desenvolvidos para lidar com esse tipo de distribuição.


#Com relação à distribuição de dados, é possível observar que em uma distribuição normal:

#68% das observações estão entre μ + σ e μ - σ

#95% das observações estão entre μ + 2σ e μ - 2σ


###################
##### z-score #####
###################

#Uma jovem está pensando em entrar para o time de atletismo de sua escola. Ela precisa escolher um esporte. Suas marcas são as seguintes:

# 61.20 segundos nos 400 metros

# 1.35 metros no salto em altura

# As médias do time da escola para esses esportes são

# 60s para os 400 metros
# 1.50m para o salto em altura

# Os desvios-padrão  do time da escola para esses esportes são

# 3 para os 400 metros
# 0.15 para o salto em altura

## Vamos calcular o z-score da nossa aluna em relação à distribuição da turma.

observado.corrida = 61.2
media.corrida = 60
dp.corrida = 3

(observado.corrida - media.corrida)/dp.corrida

observado.salto = 1.35
media.salto = 1.5
dp.salto = 0.15

(observado.salto - media.salto)/dp.salto

# Quanto mais distante de 0 está o z-score, mais distante da média
# Seria melhor ela se inscrever nos 400m

# Conclusão
# Eu consigo comparar valores de distribuições diferentes se conseguir normalizá-los de alguma forma.

# É isso que o z-score faz.

#################################################
#### O z-score e a Distribuiçõ Normal Padrão ####
#################################################

## O z-score é bastante útil pq ele nos permite calcular a probabilidade acumulada de um evento para a Distribuição Normal Padrão (DNP).

## A DNP é uma distribuição de média 0 e desvio-padrão 1. 

## Se transformarmos os valores de um conjunto de dados qualquer em seu z-score e plotarmos, teremos uma DNP!! (cf. slides) Isso facilita o cálculo de probabilidades


########## ESTUDO DE CASO 1

## Qual a probabilidade de uma mulher ter até 1,57 na amostra de 1.000.000 de alturas que plotamos no início da aula?

media = 160
dp = 15
observado = 157

z.score = (observado - media)/dp

z.score

## Agora você pode procurar essa probabilidade na tabela da DNP (Cf. Hinton, Apendix A)


########## ESTUDO DE CASO 2

# Você participou de uma corrida de rua em que completou o percurso de 5km em 28 minutos. O tempo de corrida dos participantes apresenta uma distribuição normal com média de 32 minutos e desvio-padrão de 3.5.

#Qual a probabilidade de alguém ter feito um tempo menor que o seu?


#Qual a probabilidade de alguém ter feito um tempo maior que o 


########## ESTUDO DE CASO 3

# Seu professor prometeu sortear um livro para os alunos que ficassem no top 10% da sala na prova final. A nota dos alunos apresentou uma distribuição normal, com média 6.5 e desvio-padrão 2. Sua nota foi 8.2.

# Você está entre os alunos que participarão do sorteio?

#########################
### TESTE DE HIPÓTESE ###
#########################

## Hipótese de pesquisa: estudo intensivo aumenta a inteligência (exemplo de Hinton)

## Medir inteligência: teste de QI

## Problema: eu não tenho como sair testando todo mundo que fez estudo intensivo. O que eu posso fazer é ver se as observações que eu tenho me permitem REJEITAR a hipótese de que elas tem grande probabilidade de terem saído da distribuição de QI para as pessoas em geral.

## H0 (ou hipótese nula): não há diferença entre as distribuições

## ************* Quando eu faço um teste de hipótese, eu calculo a probabilidade de rejeitar a hipótese nula *************

# Peter quer mostrar que seu QI muito provavelmente NÃO pertence à população normal, com média de 100 e dp de 15 pontos.

## Peter faz um teste de QI e o resultado é 120. Vamos calcular o z-score e a probabilidade de alguém da população comum ter um QI maior que o dele.

observado.qi = 120
media.qi = 100
dp.qi = 15

z.score.qi = (observado.qi - media.qi)/dp.qi

z.score.qi

pnorm(z.score.qi, lower.tail = F)

## A probabilidade de alguém da população normal ter um QI igual ou maior que o de Peter é de 0.091.

## Quando fazemos um teste de hipótese, estamos nos perguntando qual a probabilidade de rejeitarmos a Hipótese Nula.

## Para isso, calculamos a probabilidade de um determinado valor ocorrer em um distribuição.

## O z-score é uma maneira de calcular essa probabilidade QUANDO A SUA DISTRIBUIÇÃO É NORMAL.

##################################
#### REVISÃO DE COMANDOS DO R ####
##################################

## Posso simular conjuntos de n dados distribuídos em uma normal com a função rnorm().

# a = rnorm(100, 80, 10) # n = 1000, média = 80, desvio-padrão = 10

## Para testar a probabilidade de um determinado z-score, podermos usar a função pnorm() e indicar se o teste se repere à upper tail ou lower tail.

# pnorm(z-score, lower.tail = F) #probabilidade acumulada a partir da upper tail
# pnorm(z-score, lower.tail = T) #probabilidade acumulada a partir da lower tail

