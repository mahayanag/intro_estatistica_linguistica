################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 3                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 3 do curso introdutório de Análise e Visualização de dados. Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

## Vamos importar o conjunto de dados `scorestotal.xlsx` e relembrar qual é a média da coluna `presente`

## Lembre-se de informar qual é o diretório onde o arquivo está e de carregar os pacotes que usaresmo (readxl e ggplot2)

dados.scores = read_excel("scorestotal.xlsx")
mean(dados.scores$presente)

# Sobre medidas de dispersão:

# Cada ponto `x` tem uma variação `v` da média `µ`, que pode ser calculado como `x-µ`

# O valor de variação da nota 0 com relação à média é 0-52.62 = *-52.62*

# O valor de variação da nota 90 com relação à média é 90-52.65 = *37.35*

# A soma das variações é sempre 0, e portanto não é muito útil para descrever a dispersão dos dados

## Podemos criar um vetor com o valor da variação de cada ponto com relação à média no R. Vamos chamar esse vetor de distancia.da.media

distancia.da.media = c(dados.scores$presente - mean(dados.scores$presente))
distancia.da.media

#Abaixo, nós vemos que a soma desses valores é ZERO (ou quase isso)

soma.d.m = sum(distancia.da.media)
soma.d.m

### Dispersão - Desvio absoluto

#Uma maneira de resolver o problema da soma das distâncias da média é considerar o valor absoluto da distância dos pontos (ou seja, tirar o sinal negativo). A função abs() retorna os valores absolutos de um vetor

distancia.absoluta.da.media = abs(distancia.da.media)
distancia.absoluta.da.media

## Somando a distância absoluta de todos os pontos da média e dividindo pelo número de observações, temos uma espécie de "média" dos desvios. É o que chamamos *desvio absoluto*

distancia.absoluta.da.media = abs(distancia.da.media)
sum(distancia.absoluta.da.media)/100

##Outra maneira de resolver o problema da soma zero das distâncias do ponto com relação à média é elevar esse valor ao quadrado.

distancia.da.media.ao.quadrado = (distancia.da.media)^2
distancia.da.media.ao.quadrado

## Dispersão - Variância
# O resultado da soma das distâncias da média ao quadrado dividido pelo número de observações é o que chamamos *variância*

sum(distancia.da.media.ao.quadrado)/100

## Dispersão - Desvio-padrão

#Uma das medidas mais usadas para descrever a dispersão dos dados é o *desvio-padrão*

# O desvio padrão é a raiz-quadrada da variância

variancia = sum(distancia.da.media.ao.quadrado)/100
sqrt(variancia)

## Quando reportamos nossos dados, é muito comum reportarmos o desvio-padrão para que o leitor saiba qual foi o "espalhamento" dos valores da amostra.

#A boa notícia é que o R tem um função que faz isso, e portanto você não precisa lembrar de todas as contas que acabamos de fazer =D

sd(dados.scores$presente)

## Geralmente, a maioria dos seus dados estará em um intervalo entre `média-D.P.` e `média+D.P.` Você pode ver isso calculando esse intervalo com o código abaixo e analisando no histograma da distribuição de notas se a maioria está inserida nesse intervalo.

dp = sd(dados.scores$presente)
media = mean(dados.scores$presente)

media + dp
media - dp

## Quartis

# Os quartis dividem o conjunto de dados em pedaços, mais ou menos como a mediana. 

#Existe o 1o Quartil, que abrange 25% dos dados, o 2o Quartil, que coincide com a mediana, que abrange 50% dos dados, e o terceiro quartil, que abrange 75% dos dados.

#A **amplitude interquartil** (ou interquartile range, ou IQR) é o valor de Q3-Q1. Quanto maior esse valor, maior a dispersão dos dados.

# A amplitude interquartil também é dada pelo R através da função abaixo.

IQR(dados.scores$presente)


######################
### Estudo de caso ###
######################

##Estudo de caso

#Vamos supor que o professor que coletou os dados do conjunto scorestotal tenha motivos para querer eliminar todas as notas abaixo de 30. Depois de plotar o gráfico, o professor viu que havia apenas 5 observações abaixo desse valor. Ao conferir os alunos que tiraram essas notas, ele percebeu que um dos alunos (nota 0) faltou no dia da prova, e que os outros dois que tiraram notas muito baixas, abaixo de 30, nunca compareceram às aulas (acontece...). 

#O professor suspeita que manter esses dados não dá uma boa amostra de como os alunos que compareceram às aulas e à prova se saíram no teste, e por isso resolve fazer uma nova análise excluindo esses valores extremos.

#(a) O que acontecerá com a média?
#(b) O que acontecerá com a mediana?
#(c) O que acontecerá com as medidas de dispersão como IQR e desvio-padrão?

# Para podermos responder essas perguntas, vamos precisar mexer no nosso conjunto de dados.

# Vamos criar um subconjunto dos dados para analisar, excluindo as medidas menores que 20.

# Evite ao máximo mexer na planilha com seu conjunto de dados ou criar um conjunto de dados novo, ou vc vai ter uma pasta parecida cheia de arquivos que, dali alguns anos, não conseguirá enteder (been there, done that).

#O R conta com o `dplyr` um ótimo pacote para manipular seu conjunto de dados. Uma vez que você escreva seu script com ele, não precisará criar arquivos novos em sua pasta. Ele faz parte de um pacote maior, chamado `tidyverse`, que precisa ser baixado e carregado.

install.packages("tidyverse")
library(tidyverse)

#O dplyr funciona com um operador que chamamos 'pipe', representado como %>%. Ele permite que você use o output de uma linha *L* como input da linha seguinte *L+1*. Vamos ver um exemplo:

#linha 1 - cria um conjunto novos.dados a partir de dados.scores

#linha 2 - seleciona apenas a coluna "presente" do conjunto criado na linha 1

#linha 3 - filtra apenas aqueles valores iguais ou maiores que 20 para a coluna presente no conjunto criado na l2

novos.dados = dados.scores%>% #linha 1
  select(presente)%>%         #linha 2
  filter(presente >= 30)       #linha 3

## Para conferir, organize em ordem crescente os valores da coluna "presente" em `dados.scores` (o conjunto total) e `novos.dados`.

sort(dados.scores$presente)
sort(novos.dados$presente)

## Tire a média, mediana, desvio padrão, IQR e plote um novo histograma desse conjunto de dados. Preste atenção com o que aconteceu com as medidas de tendência central e dispersão quando você tira esses valores extremos.

##################
#### BOXPLOTS ####
##################

#Outra maneira de visualizar dados é com um gráfico chamado boxplot, que usa informações fornecidas pelos quartis e as organiza graficamente.

#Sven está se preparando para uma maratona de 15 milhas. O conjunto abaixo tem o número de milhas que ele correu em cada um dos seus 23 treinos e as medidas descritivas do conjunto de dados.

milespp = c(2, 2, 3, 4, 5, 5, 6, 6, 7, 5, 8, 9, 2, 10, 11, 4, 12, 2, 13, 4, 15, 5, 11)
sort(milespp)

summary(milespp)

# Você vai perceber que a faixa de milhas entre o primeiro quartil e a mediana é muito menor do que a faixa entre mediana e o terceiro quartil. O boxplot mostra essas diferenças.

# A linha que marca o início (de baixo para cima) do boxplot marca o primeiro quartil (Q1), o traço cortando o quadrado ao meio é a mediana, o traço marcando o fim do quadrado é o terceiro quartil (Q3). As linhas que se estendem das pontas do quadrado indicam uma distância de 1.5 amplitude interquartil a partir do Q1 e Q3. Essas linhas são uma maneira de identificar as medidas que estão muito distantes da mediana.

## Fazer um boxplot no ggplot é tão fácil quanto fazer um histograma. Você só precisa mudar a informação do tipo de gráfico que deseja e pensa o que colocar no eixo x e no eixo y.

ggplot(dados.scores, aes(x="", y=presente))+ #y = valores da coluna presente
  geom_boxplot()

##Podemos deixar nosso boxplot mais apresentável

ggplot(dados.scores, aes(x="", y=presente))+ #y = valores da coluna presente
  geom_boxplot(alpha=0.5, outlier.size = 3)+ #alpha = transparência, outlier.size = tamanho                                              #das bolinhas indicando outlier
  labs(y="Notas na prova (presente)")+       #legenda eixo y
  theme_bw()                                 #tema do gráfico (fundo branco)

## Geralmente, quando fazemos boxplots, nós queremos comparar dois grupos. Para isso, é preciso colocar no eixo x os grupos de histogramas que queremos comparar. No nosso caso, queremos comparar as notas nos dois anos de curso. O eixo y teria um vetor como "nota" e o eixo x deve receber um vetor para indicar a que ano aquela nota pertence (veja os slides da aula). Não conseguiremos fazer isso sem manipular o conjunto de dados.

## Nossos dados tem um formato wide: uma coluna indica as notas do ano presente e outra indica as notas do ano passado. Queremos criar uma coluna só com as notas de ambos os anos, e, ao lado dessa coluna, indicar a que ano (presente ou passado) cada nota pertence. Ou seja, queremos transformar nossos dados para um formato longo.

## Frequentemente precisamos alterar o formato dos nossos dados para fazer análise no R ou em outros programas. A vantagem do R é que essa alteração pode ser feita facilmente com o dplyr a partir da função gather(), e você não precisa fazer isso manualmente.

#Vamos criar um conjunto em formato longo chamado long.dados. Aplicamos a função gather()informando o nome das duas novas colunas que vamos criar (ano e nota) seguidas pelas colunas que queremos mesclar (presente e passado).

long.dados = dados.scores%>%  
  gather(ano, nota, presente, passado)

#Dê uma olhada no novo conjunto de dados que criou e está na área Environment.

#Acima, quisemos apenas mesclar apenas duas colunas, mas se vc tivesse três, quatro, cinco colunas com notas, deveria apenas seguir listando o nome de todas elas, separando-as com vírgulas.

# Agora fica fácil criar um boxplot com os comandos que você já conhece.

ggplot(long.dados, aes(x=ano, y=nota))+ 
  geom_boxplot()

ggplot(long.dados, aes(x=ano, y=nota))+
  geom_boxplot(alpha=0.7, outlier.size = 2)+
  labs(x="Ano", y="Notas na prova")+
  theme_bw()

## O formato longo é útil para tirar as medidas de dispersão e tendência central de forma mais rápida. Fazemos isso usando group_by() e summarise()

long.dados%>%
  group_by(ano)%>% #group_by - agrupa os dados pela variável indicada
  summarise(mediana = median(nota), media = mean(nota), dist.interquartil = IQR(nota), desvio.padrao = sd(nota))

# Lembre-se de que você vai especificando os comandos do dplyr de modo que a função explícita na linha **L** vai ser o input do que ocorre na linha **L+1**. 

# É por isso que primeiro pedimos para agrupar os dados por ano por meio de *group_by()*, e depois pedimos para que o R nos retorne as medidas solicitadas em *summarise()*

###################################
#### DICAS PARA TAREFA DE CASA ####
###################################

## Hoje você aprendeu a usar o comando filter() para manipular seu conjunto de dados. Vale mencionar como se deve usar esse comando para selecionar dados de uma variável categórica.

## filter(ano == "presente") #seleciona apenas as linhas da coluna "ano" preenchidas com "maria". note que o sinal de igual é duplo!!

## filter(ano != "presente") #seleciona todas as linhas da coluna "ano" que NÃO estejam preenchidas com "presente".

## Perceba que a observação que você quer selecionar ou descartar (presente, no caso) deve ser sempre usada entre aspas nesse comando se sua variável é categórica.

##############################
#### REVISÃO DOS COMANDO  ####
##############################

########################
###### DESCRIÇÃO #######
########################

## Algumas funções para descrever seu conjunto de dados

## sd() #calcula o desvio-padrão de um vetor
## IQR() #calcula o interquartile range de um vetor (lembre-se: é IQR, não iqr)
## summary() #retorna informações sobre 1o e 3o quartil, mediana, média, valor máximo e mínimo de um vetor

###################################
###### MANIPULAÇÃO DE DADOS #######
###################################

## Algumas funções para usar o dplyr(parte do pacote tideverse). Lembre-se de que as funções usarão como input o conjunto de dados da linha superior terminada com pipe (%>%).

### SELECIONAR R FILTRAR

## select() #seleciona uma coluna em um conjunto de dados
## filter(x > y) #filtra as linhas da coluna x com valor maior que y
## filter(x < y) #filtra as linhas da coluna x com valor menor que y
## filter(x == y) #filtra as linhas da coluna x com valor igual a y
## filter(x != y) #filtra as linhas da coluna x com valor maior que y

### AGRUPANDO E COMPARANDO

## group_by(x) #agrupa os dados do conjunto especificado na linha anterior pelos valores da coluna x
## summarise(mediana = median(y), media = mean(y), dist.interquartil = IQR(y), desvio.padrao = sd(y)) #lista as medidas descritivas que vc especifica para um vetor numérico y; muito útil para ser usado em conjunto com a função group_by

### FORMATO

## gather(A, B, x, y, z) #transforma dados em formato wide para formato longo. Aqui, pede-se para formar as novas colunas de nome A e B mesclando os valores presentes nas colunas x, y e z


####################################
###### VISUALIZAÇÃO: BOXPLOT #######
####################################


## ggplot(dados, aes(x, y))+
##   geom_boxplot() # indica que o gráfico desenhado deve ser um boxplot

