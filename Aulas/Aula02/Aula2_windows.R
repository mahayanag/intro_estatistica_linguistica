################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 2                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 2 do curso introdutório de Análise e Visualização de dados (PPgEL/UFRN). Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

#####################
#### INTRODUÇÃO #####
#####################

## Tudo que for precedido pelo símbolo # em uma linha é classificado como  comentário
## Comentários não são entendidos como código, e portanto o programa não tentará executá-los


## Essa linha é um comentário. A linha abaixo é um comando. Deixe o cursor (aquela barrinha vertical que fica piscando) na linha do comando que deseja executar e aperte CTRL+ENTER. Tente fazer isso com o comando da linha abaixo.
2+2


##Você viu o resultado da equação acima ser executado na janela abaixo

##Repita o comando com a equação abaixo
3+4

##Repita o comando com a função abaixo
sqrt(4)

##Repita o comando com a função abaixo
sqrt(81)

##Para executar mais de uma linha de código, selecione tudo com o botão direito do mouse e aperte CTRL+ENTER
567+876
54*34
28-98
sqrt(121)

#Pronto, todos os códigos acima foram executados de uma única vez na janela CONSOLE

#######################
## vetores e funções ##
#######################

#Geralmente não usamos o R para fazer contas simples, mas para realizar cálculos sobre vetores. 

#Imagine que juntamos os valores pagos de aluguel por 13 estudantes que acabaram de mudar para Natal para estudar na UFRN, e com esses valores criamos o vetor "aluguel"

#Nós criamos um vetor assim:

aluguel = c(345.2, 932, 784, 1042.3, 2102.9, 917.9, 890, 732, 832, 974.4, 668.4, 1022, 1210)

#ou assim

aluguel <- c(345.2, 932, 784, 1042.3, 2102.9, 917.9, 890, 732, 832, 974.4, 668.4, 1022, 1210)

#Perceba que você criou um vetor chamado "aluguel" na área Environment.

#Suponha que eu queira saber a média aritmética desse conjunto de dados. Que conta preciso fazer?

#soma de todos os números do vetor/número de observações no vetor

#O R é capaz de fazer isso aplicando os comandos sum() e length() no vetor aluguel.

sum(aluguel)
length(aluguel)


sum(aluguel)/length(aluguel)

soma = sum(aluguel)
n = length(aluguel)

soma/n

#Uma das vantagens do R é que ele faz essas contas sem precisarmos saber a fórmula!

#A função para calcular a média de um vetor é `mean(nome do vetor)`

mean(aluguel)


## Sua vez de treinar

#Crie um vetor com as idades dos alunos da turma e

#(a) identifique a média de idade da turma 
#(b) descubra quantos anos a turma tem se somarmos todas as idades

#
#
#
#
#

##No geral, nós não inserimos os vetores manualmente para análise, mas os importamos de uma tabela.

#Vamos aprender a fazer isso no R.

#########################
## Começando uma seção ##
#########################

## Instalando e carregando os pacotes

# Precisamos primeiro instalar os pacotes que vamos usar com a função `install.packages()`

install.packages("readxl") #permite carregar arquivos .xls
install.packages("ggplot2") #permite gerar gráficos a partir de um conjunto de dados

# Vamos carregar os pacotes que iremos usar nesse curso com a função `library()`

library(readxl)
library(ggplot2)

# Agora que você já carregou os pacotes que precisa para fazer as análises desse tutorial, precisa definir sua área de trabalho, i.e., a pasta de onde vai importar seus conjuntos de dados. Você pode fazer isso clicando nos menus acima, seguindo a ordem:

#session (ou seção) >> set working directory >> choose directory

# e vai aparecer um pop-up para indicar a pasta onde está seu conjunto de dados. Note que vc não vai selecionar o conjunto de dados, você vai indicar a pasta onde ele está.

# Outra maneira é indicar o caminho manualmente. No meu computador, a pasta de conjunto de dados para esse tutorial está na pasta "datasets", e para chegar a essa pasta o caminho é

#Documents > Mahayana > academics > cursos > introstatistics > datasets

#Eu informo isso ao R através do comando setwd() da seguinte maneira:

##setwd("~/Documents/Mahayana/academics/cursos/introstatistics/datasets/")

#No windows, eu usaria um comando como 

## setwd("C:/Users/Mahayana/academics/cursos/introstatistics/datasets")

#Pessoalmente prefiro informar assim, pois mantenho minhas pastas organizadas e, daqui a meses ou anos, quando quiser rodar o código, basta rodar o comando acima que ele acha o diretório para mim, sem que eu tenha que ficar indicando manualmente.

# Agora que informamos a área de trabalho, vamos importar o conjunto de dados que queremos.

# Para esse tutorial, vamos importar o conjunto "scores.xlsx", com o exemplo usado em Hinton (2004, Cap1).Esse conjunto de dados reúne as notas dos alunos de 0 a 100 para uma disciplina de graduação.

# Importamos o conjunto, que é .xlsx, com a função read_excel, e damos a esse conjunto de dados o nome dados.scores

dados.scores = read_excel("scores.xlsx")

# Você vai ver que criou um conjunto de dados chamado "dados.scores" na área Environment. Ele tem 100 observações de 1 variável. Clique para vê-lo.

#Você também pode importar arquivos em .txt. Nesse caso, use a função `read.table` e adicione à sintaxe a expressão header = TRUE para informar que a primeira linha do arquivo é o nome (header) da coluna:

## dados.scores = read.table("scores.txt,", header = TRUE)

############################
## Estatística descritiva ##
############################

## Conhecendo o conjunto de dados

#Quando você for usar uma função qualquer (e.g. `f()`) para ler um vetor qualquer (e.g.,`v`) dentro de um conjunto de dados qualquer (e.g. `dataset`), sua sintaxe será `f(dataset$v)`

#Vamos ordenar o conjunto de dados presente no vetor scores do conjunto de dados `dados.score` com a função sort(), e vamos ver quantas observações ele tem com a função length() para ver como isso funciona:

length(dados.scores$scores)
sort(dados.scores$scores)

## Conhecendo a distribuição do conjunto de dados

#Para conhecer a distribuição dos nossos dados, "plotamos" a frequência dos dados em um tipo de gráfico chamado histograma (cf. Hinton, p.19)

#No R, usamos um pacote chamado ggplot2 e a função ggplot() para fazer vários tipos de gráfico, inclusive histogramas.

#A sintaxe do ggplot2 é:

## ggplot(nome_do_conjunto_de_dados, aes(x = valor_que_vai_no_eixo_x, y =  valor_que_vai_no_eixo_y))

#Dica para se lembrar da sintaxe: `aes` vem de aesthetics. Ou seja, essa função define a estética, a cara do gráfico a partir dos vetores do conjunto de dados que estamos analisando.

## Conhecendo a distribuição do conjunto de dados

#Vamos tentar fazer o histograma dos dados dos scores para fazer algo semelhante ao gráfico da página 19 de Hinton

ggplot(dados.scores, aes(x = scores, y = ))

# O comando acima deu erro pq vc especificou o que vai no eixo x e y (o y fica em branco por se tratar de frequência dos dados obtidos no eixo x), mas não indicou que tipo de gráfico quer. Colocamos um sinal de + para indicar que o código continua na linha seguinte, e é nessa linha que dizemos se queremos um histograma, um gráfico de barras, de linhas, um boxplot etc.

ggplot(dados.scores, aes(x = scores, y = ))+
  geom_histogram()

#Queremos espalhar os dados para que cada quadradinho no gráfico represente um valor. Queremos dizer que os valores (breaks) do histograma devem ir de 0 a 100 (`seq(0,100)`) e que as observações devem ser dadas em um intervalo de 1 ponto (`seq(by=1)`)

ggplot(dados.scores, aes(x = scores, y = ))+
  geom_histogram(breaks=seq(0, 100, by = 1))

## No gráfico apresentado em aula (cf Aula2.html), você terá um gráfico mais arrumado, mas os comandos básicos do ggplot são esses que acabamos de ver

# Você pode comparar esse gráfico que fez com os valores do vetor organziados em ordem crescente

sort(dados.scores$scores)

##################################
## MEDIDAS DE TENDÊNCIA CENTRAL ##
##################################

# Medidas de tendência central são úteis para identificar um resultado que representa o conjunto de dados. Algumas dessas medidas são:

#média
#mediana
#moda

#O comando para identificar a mediana no R é median(), e para a média é mean()

# A vantagem da média é que ela é sensível a todos os pontos do conjunto de dados. No entanto, essa sensibilidade pode fazer com que seu valor não seja representativo do conjunto se houver uma medida muito extrema.

# A mediana é o ponto que divide o conjunto de dados na metade. A presença de um valor extremo alterará pouco o valor da mediana, e é possível que o valor da mediana nem mude.

# Apesar de essas medidas darem uma ideia de como são os dados, é FUNDAMENTAL que conheçamos a forma da distribuição desses dados para sabermos como analisá-los. É por isso que se aconselha que façamos gráficos como histograma antes mesmo de começar a análise.

##############
### TAREFA ###
##############

## Agora é com você

#Você tem o arquivo chamado `scorestotal.xlsx`. Nesse arquivo, você tem uma coluna com o conjunto de dados "presente", que acabamos de analisar, e o conjunto "passado", descrito por Hinton na página 18. A coluna "presente" indica as notas obtidas no ano corrente. A coluna "passado" indica as notas obtidas no ano anterior.


#(a) Importe o conjunto de dados
#(b) Calcule as medidas de tendência central para os dois anos
#(c) Faça um histograma dos dois anos
#(d) O que você pode dizer sobre as médias e medianas desse conjunto de dados?


#################
#### REVISÃO ####
#################

# Uma revisão das funções aprendidas nesse tutorial

## install.packages() #instala um pacote
## library() #carrega um pacote
## setwd() #indica o caminho para a pasta em que estão o conjunto de dados
## read_excel() #importa conjunto de dados em xlsx
## read.table() #importa conjunto de dados em outros formatos


## c() #cria um vetor
## sum() #soma todos os valores de um vetor
## length() #indica o número de observações em um vetor
## mean() #indica a média de um vetor
## median() #indica a mediana de um vetor
## sort() #organiza as observações do vetor por ordem crescente (para ordem descrescente, adicione decreasing = TRUE)


## ggplot(dados, aes(x,y)) + #indica os vetores usados para definir eixo x e y para qualquer
#tipo de gráfico
##   geom_histogram() + #indica o tipo de gráfico - nesse caso, um histograma 
#(mas há geom_line, geom_boxplot, geom_bar, geom_point...)
##   labs(x = "", y = "") #personaliza o nome dos eixos x e y
