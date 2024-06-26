################################################################################
########### Programa de P�s-gradua��o em Estudos da Linguagem (UFRN) ###########
########### An�lise e Visualiza��o de dados: Aula 3                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMA��ES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 3 do curso introdut�rio de An�lise e Visualiza��o de dados. Por esse motivo, alguns dos comandos podem n�o ser t�o transparentes se forem realizados de forma independente.

## Vamos importar o conjunto de dados `scorestotal.xlsx` e relembrar qual � a m�dia da coluna `presente`

## Lembre-se de informar qual � o diret�rio onde o arquivo est� e de carregar os pacotes que usaresmo (readxl e ggplot2)

dados.scores = read_excel("scorestotal.xlsx")
mean(dados.scores$presente)

# Sobre medidas de dispers�o:

# Cada ponto `x` tem uma varia��o `v` da m�dia `�`, que pode ser calculado como `x-�`

# O valor de varia��o da nota 0 com rela��o � m�dia � 0-52.62 = *-52.62*

# O valor de varia��o da nota 90 com rela��o � m�dia � 90-52.65 = *37.35*

# A soma das varia��es � sempre 0, e portanto n�o � muito �til para descrever a dispers�o dos dados

## Podemos criar um vetor com o valor da varia��o de cada ponto com rela��o � m�dia no R. Vamos chamar esse vetor de distancia.da.media

distancia.da.media = c(dados.scores$presente - mean(dados.scores$presente))
distancia.da.media

#Abaixo, n�s vemos que a soma desses valores � ZERO (ou quase isso)

soma.d.m = sum(distancia.da.media)
soma.d.m

### Dispers�o - Desvio absoluto

#Uma maneira de resolver o problema da soma das dist�ncias da m�dia � considerar o valor absoluto da dist�ncia dos pontos (ou seja, tirar o sinal negativo). A fun��o abs() retorna os valores absolutos de um vetor

distancia.absoluta.da.media = abs(distancia.da.media)
distancia.absoluta.da.media

## Somando a dist�ncia absoluta de todos os pontos da m�dia e dividindo pelo n�mero de observa��es, temos uma esp�cie de "m�dia" dos desvios. � o que chamamos *desvio absoluto*

distancia.absoluta.da.media = abs(distancia.da.media)
sum(distancia.absoluta.da.media)/100

##Outra maneira de resolver o problema da soma zero das dist�ncias do ponto com rela��o � m�dia � elevar esse valor ao quadrado.

distancia.da.media.ao.quadrado = (distancia.da.media)^2
distancia.da.media.ao.quadrado

## Dispers�o - Vari�ncia
# O resultado da soma das dist�ncias da m�dia ao quadrado dividido pelo n�mero de observa��es � o que chamamos *vari�ncia*

sum(distancia.da.media.ao.quadrado)/100

## Dispers�o - Desvio-padr�o

#Uma das medidas mais usadas para descrever a dispers�o dos dados � o *desvio-padr�o*

# O desvio padr�o � a raiz-quadrada da vari�ncia

variancia = sum(distancia.da.media.ao.quadrado)/100
sqrt(variancia)

## Quando reportamos nossos dados, � muito comum reportarmos o desvio-padr�o para que o leitor saiba qual foi o "espalhamento" dos valores da amostra.

#A boa not�cia � que o R tem um fun��o que faz isso, e portanto voc� n�o precisa lembrar de todas as contas que acabamos de fazer =D

sd(dados.scores$presente)

## Geralmente, a maioria dos seus dados estar� em um intervalo entre `m�dia-D.P.` e `m�dia+D.P.` Voc� pode ver isso calculando esse intervalo com o c�digo abaixo e analisando no histograma da distribui��o de notas se a maioria est� inserida nesse intervalo.

dp = sd(dados.scores$presente)
media = mean(dados.scores$presente)

media + dp
media - dp

## Quartis

# Os quartis dividem o conjunto de dados em peda�os, mais ou menos como a mediana. 

#Existe o 1o Quartil, que abrange 25% dos dados, o 2o Quartil, que coincide com a mediana, que abrange 50% dos dados, e o terceiro quartil, que abrange 75% dos dados.

#A **amplitude interquartil** (ou interquartile range, ou IQR) � o valor de Q3-Q1. Quanto maior esse valor, maior a dispers�o dos dados.

# A amplitude interquartil tamb�m � dada pelo R atrav�s da fun��o abaixo.

IQR(dados.scores$presente)


######################
### Estudo de caso ###
######################

##Estudo de caso

#Vamos supor que o professor que coletou os dados do conjunto scorestotal tenha motivos para querer eliminar todas as notas abaixo de 30. Depois de plotar o gr�fico, o professor viu que havia apenas 5 observa��es abaixo desse valor. Ao conferir os alunos que tiraram essas notas, ele percebeu que um dos alunos (nota 0) faltou no dia da prova, e que os outros dois que tiraram notas muito baixas, abaixo de 30, nunca compareceram �s aulas (acontece...). 

#O professor suspeita que manter esses dados n�o d� uma boa amostra de como os alunos que compareceram �s aulas e � prova se sa�ram no teste, e por isso resolve fazer uma nova an�lise excluindo esses valores extremos.

#(a) O que acontecer� com a m�dia?
#(b) O que acontecer� com a mediana?
#(c) O que acontecer� com as medidas de dispers�o como IQR e desvio-padr�o?

# Para podermos responder essas perguntas, vamos precisar mexer no nosso conjunto de dados.

# Vamos criar um subconjunto dos dados para analisar, excluindo as medidas menores que 20.

# Evite ao m�ximo mexer na planilha com seu conjunto de dados ou criar um conjunto de dados novo, ou vc vai ter uma pasta parecida cheia de arquivos que, dali alguns anos, n�o conseguir� enteder (been there, done that).

#O R conta com o `dplyr` um �timo pacote para manipular seu conjunto de dados. Uma vez que voc� escreva seu script com ele, n�o precisar� criar arquivos novos em sua pasta. Ele faz parte de um pacote maior, chamado `tidyverse`, que precisa ser baixado e carregado.

install.packages("tidyverse")
library(tidyverse)

#O dplyr funciona com um operador que chamamos 'pipe', representado como %>%. Ele permite que voc� use o output de uma linha *L* como input da linha seguinte *L+1*. Vamos ver um exemplo:

#linha 1 - cria um conjunto novos.dados a partir de dados.scores

#linha 2 - seleciona apenas a coluna "presente" do conjunto criado na linha 1

#linha 3 - filtra apenas aqueles valores iguais ou maiores que 20 para a coluna presente no conjunto criado na l2

novos.dados = dados.scores%>% #linha 1
  select(presente)%>%         #linha 2
  filter(presente >= 30)       #linha 3

## Para conferir, organize em ordem crescente os valores da coluna "presente" em `dados.scores` (o conjunto total) e `novos.dados`.

sort(dados.scores$presente)
sort(novos.dados$presente)

## Tire a m�dia, mediana, desvio padr�o, IQR e plote um novo histograma desse conjunto de dados. Preste aten��o com o que aconteceu com as medidas de tend�ncia central e dispers�o quando voc� tira esses valores extremos.

##################
#### BOXPLOTS ####
##################

#Outra maneira de visualizar dados � com um gr�fico chamado boxplot, que usa informa��es fornecidas pelos quartis e as organiza graficamente.

#Sven est� se preparando para uma maratona de 15 milhas. O conjunto abaixo tem o n�mero de milhas que ele correu em cada um dos seus 23 treinos e as medidas descritivas do conjunto de dados.

milespp = c(2, 2, 3, 4, 5, 5, 6, 6, 7, 5, 8, 9, 2, 10, 11, 4, 12, 2, 13, 4, 15, 5, 11)
sort(milespp)

summary(milespp)

# Voc� vai perceber que a faixa de milhas entre o primeiro quartil e a mediana � muito menor do que a faixa entre mediana e o terceiro quartil. O boxplot mostra essas diferen�as.

# A linha que marca o in�cio (de baixo para cima) do boxplot marca o primeiro quartil (Q1), o tra�o cortando o quadrado ao meio � a mediana, o tra�o marcando o fim do quadrado � o terceiro quartil (Q3). As linhas que se estendem das pontas do quadrado indicam uma dist�ncia de 1.5 amplitude interquartil a partir do Q1 e Q3. Essas linhas s�o uma maneira de identificar as medidas que est�o muito distantes da mediana.

## Fazer um boxplot no ggplot � t�o f�cil quanto fazer um histograma. Voc� s� precisa mudar a informa��o do tipo de gr�fico que deseja e pensa o que colocar no eixo x e no eixo y.

ggplot(dados.scores, aes(x="", y=presente))+ #y = valores da coluna presente
  geom_boxplot()

##Podemos deixar nosso boxplot mais apresent�vel

ggplot(dados.scores, aes(x="", y=presente))+ #y = valores da coluna presente
  geom_boxplot(alpha=0.5, outlier.size = 3)+ #alpha = transpar�ncia, outlier.size = tamanho                                              #das bolinhas indicando outlier
  labs(y="Notas na prova (presente)")+       #legenda eixo y
  theme_bw()                                 #tema do gr�fico (fundo branco)

## Geralmente, quando fazemos boxplots, n�s queremos comparar dois grupos. Para isso, � preciso colocar no eixo x os grupos de histogramas que queremos comparar. No nosso caso, queremos comparar as notas nos dois anos de curso. O eixo y teria um vetor como "nota" e o eixo x deve receber um vetor para indicar a que ano aquela nota pertence (veja os slides da aula). N�o conseguiremos fazer isso sem manipular o conjunto de dados.

## Nossos dados tem um formato wide: uma coluna indica as notas do ano presente e outra indica as notas do ano passado. Queremos criar uma coluna s� com as notas de ambos os anos, e, ao lado dessa coluna, indicar a que ano (presente ou passado) cada nota pertence. Ou seja, queremos transformar nossos dados para um formato longo.

## Frequentemente precisamos alterar o formato dos nossos dados para fazer an�lise no R ou em outros programas. A vantagem do R � que essa altera��o pode ser feita facilmente com o dplyr a partir da fun��o gather(), e voc� n�o precisa fazer isso manualmente.

#Vamos criar um conjunto em formato longo chamado long.dados. Aplicamos a fun��o gather()informando o nome das duas novas colunas que vamos criar (ano e nota) seguidas pelas colunas que queremos mesclar (presente e passado).

long.dados = dados.scores%>%  
  gather(ano, nota, presente, passado)

#D� uma olhada no novo conjunto de dados que criou e est� na �rea Environment.

#Acima, quisemos apenas mesclar apenas duas colunas, mas se vc tivesse tr�s, quatro, cinco colunas com notas, deveria apenas seguir listando o nome de todas elas, separando-as com v�rgulas.

# Agora fica f�cil criar um boxplot com os comandos que voc� j� conhece.

ggplot(long.dados, aes(x=ano, y=nota))+ 
  geom_boxplot()

ggplot(long.dados, aes(x=ano, y=nota))+
  geom_boxplot(alpha=0.7, outlier.size = 2)+
  labs(x="Ano", y="Notas na prova")+
  theme_bw()

## O formato longo � �til para tirar as medidas de dispers�o e tend�ncia central de forma mais r�pida. Fazemos isso usando group_by() e summarise()

long.dados%>%
  group_by(ano)%>% #group_by - agrupa os dados pela vari�vel indicada
  summarise(mediana = median(nota), media = mean(nota), dist.interquartil = IQR(nota), desvio.padrao = sd(nota))

# Lembre-se de que voc� vai especificando os comandos do dplyr de modo que a fun��o expl�cita na linha **L** vai ser o input do que ocorre na linha **L+1**. 

# � por isso que primeiro pedimos para agrupar os dados por ano por meio de *group_by()*, e depois pedimos para que o R nos retorne as medidas solicitadas em *summarise()*

###################################
#### DICAS PARA TAREFA DE CASA ####
###################################

## Hoje voc� aprendeu a usar o comando filter() para manipular seu conjunto de dados. Vale mencionar como se deve usar esse comando para selecionar dados de uma vari�vel categ�rica.

## filter(ano == "presente") #seleciona apenas as linhas da coluna "ano" preenchidas com "maria". note que o sinal de igual � duplo!!

## filter(ano != "presente") #seleciona todas as linhas da coluna "ano" que N�O estejam preenchidas com "presente".

## Perceba que a observa��o que voc� quer selecionar ou descartar (presente, no caso) deve ser sempre usada entre aspas nesse comando se sua vari�vel � categ�rica.

##############################
#### REVIS�O DOS COMANDO  ####
##############################

########################
###### DESCRI��O #######
########################

## Algumas fun��es para descrever seu conjunto de dados

## sd() #calcula o desvio-padr�o de um vetor
## IQR() #calcula o interquartile range de um vetor (lembre-se: � IQR, n�o iqr)
## summary() #retorna informa��es sobre 1o e 3o quartil, mediana, m�dia, valor m�ximo e m�nimo de um vetor

###################################
###### MANIPULA��O DE DADOS #######
###################################

## Algumas fun��es para usar o dplyr(parte do pacote tideverse). Lembre-se de que as fun��es usar�o como input o conjunto de dados da linha superior terminada com pipe (%>%).

### SELECIONAR R FILTRAR

## select() #seleciona uma coluna em um conjunto de dados
## filter(x > y) #filtra as linhas da coluna x com valor maior que y
## filter(x < y) #filtra as linhas da coluna x com valor menor que y
## filter(x == y) #filtra as linhas da coluna x com valor igual a y
## filter(x != y) #filtra as linhas da coluna x com valor maior que y

### AGRUPANDO E COMPARANDO

## group_by(x) #agrupa os dados do conjunto especificado na linha anterior pelos valores da coluna x
## summarise(mediana = median(y), media = mean(y), dist.interquartil = IQR(y), desvio.padrao = sd(y)) #lista as medidas descritivas que vc especifica para um vetor num�rico y; muito �til para ser usado em conjunto com a fun��o group_by

### FORMATO

## gather(A, B, x, y, z) #transforma dados em formato wide para formato longo. Aqui, pede-se para formar as novas colunas de nome A e B mesclando os valores presentes nas colunas x, y e z


####################################
###### VISUALIZA��O: BOXPLOT #######
####################################


## ggplot(dados, aes(x, y))+
##   geom_boxplot() # indica que o gr�fico desenhado deve ser um boxplot

