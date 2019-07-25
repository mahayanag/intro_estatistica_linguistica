################################################################################
########### Programa de Pós-graduação em Estudos da Linguagem (UFRN) ###########
########### Análise e Visualização de dados: Aula 5                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 5 do curso introdutório de Análise e Visualização de dados (PPgEL/UFRN - 2018). Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente.

## É possível calcular o exemplo de Hinton (2004, Cap 7) usando o R como calculadora para chegar no z-score e depois usar a função pnorm() para calcular a probabilidade de um valor z.

media.populacao = 3.2
media.amostra = 3
sd.populacao = 0.9
n.amostra = 100

z = (media.amostra-media.populacao)/(sd.populacao/sqrt(n.amostra))

pnorm(z, lower.tail = T)
pnorm(-2.22, lower.tail = T)


### ESTUDO DE CASO 2

## Uma empresa ensaca cafés afirmando que cada saco tem ***500g***. A empresa também informa que o maquinário que produz o conteúdo deve retornar esse valor com *** ?? = 25g***.

## Uma ***amostra 30 pacotes*** é analisada pelo controle de qualidade, e a média de peso dessa amostra é de ***513g***. O gerente de produção quer testar se a máquina tem produzido pacotes com um peso maior que o esperado.

#Assumindo um ?? = 0.05, é possível afirmar que a amostra recolhida indica que o maquinário está produzindo pacotes com média superior ao valor pretendido?

media.populacao = 0?
media.amostra = 0?
sd.populacao = 0?
n.amostra = 0?

z = 0?

pnorm(z, lower.tail = )

#### ESTUDO DE CASO 3 (esse problema é uma versão mais correta de investigar o problema 2 do HW 4)

## Uma escola investiu numa nova técnica de ensino de redação de forma experimental. Durante um ano, uma turma de 30 alunos selecionados aleatoriamente dentre os alunos do terceiro ano tiveram aulas com essa nova técnica.

#Ao fim do ano, a média dessa turma na prova de redação do ENEM foi de 698. A média do restante dos alunos foi 650, com desvio-padrão de 25.

#Considerando um alfa de 0.05, pode-se rejeitar a H0?

## H0:
## Ha:


###############
### TESTE T ###
###############

## Para realizar o teste-t, é importante informarmos o grau de liberdade. O grau de liberdade é igual a n-1. Geralmente usamos o n-1 para calcular estatísticas de uma AMOSTRA. Vimos que o desvio-padrão de uma população é resultante de um valor dividido por n. O desvio-padrão amostral é resultante de um valor dividido por n-1. A função sd() sempre nos retorna um valor considerando n-1 no denominador. Consulte a ajuda sobre a função para confirmar:

?sd

#Tente calcular a probabilidade do valor -2 em uma distribuição z (a distribuição normal padrão, que vimos na última aula) e em uma distribuição t.

pnorm(-2)
pt(-2)

#Agora tente fazer o cálculo informando os graus de liberdade.

pt(-2, df = 2)
pt(-2, df = 6)
pt(-2, df = 30)
pt(-2, df = 100)

### ESTUDO DE CASO: teste-t


#Um gerente de produção quer ter certeza de que sua fábrica tem produzido pacotes com 500g de café. Para isso, ele anota o peso de uma amostra de 15 pacotes.

cafe = c(501, 506, 499, 490, 491, 493, 490, 497, 498, 488, 515, 494, 497, 504, 504)
mean(cafe)

media.amostra = mean(cafe) #média da amostra
media.padrao = 500 #média pretendida
s = sd(cafe) #desvio-padrão amostral (s)
n = length(cafe) #número de observações da amostra


t = (media.amostra-media.padrao)/(s/sqrt(n)) ## é a mesma fórmula que já usamos, mas dessa vez usando *s* em vez do desvio-padrão da população.
t

pt(t, df = n-1, lower.tail = F) #Probabilidade acumulada na upper-tail
pt(t, df = n-1, lower.tail = T) #Probabilidade acumulada na lower-tail 

## Há um jeito mais fácil de fazer um teste-t com uma amostra no R

t.test(cafe, mu=500, alternative = "greater") #Ha: média da amostra é *maior* que 500

t.test(cafe, mu=500, alternative = "less") #Ha: média da amostra é *menor* que 500

t.test(cafe, mu=500, alternative = "two.sided") #Ha: média da amostra é *diferente* que 500

#A função t.test() realiza um teste-t considerando ?? = 0.05.

# O cálculo do p-valor considerando esse ?? dependerá da Ha especificada.

# O teste retorna também os intervalos de confiança para a HA especificada.

# Você verá que se o seu teste der um p<0.05, o valor especificado em mu estará fora do intervalo de confiança.

# Lembre-se: você NÃO DEVE fazer testes considerando todas as Ha, mas sim definir qual é sua Ha ANTES do teste

### ESTUDO DE CASO: teste-t 

# Uma escola está pensando se deve investir em uma nova técnica de ensino de redação. Durante um ano, uma turma de 30 alunos selecionados aleatoriamente dentre os alunos do terceiro ano tiveram aulas com essa nova técnica. Abaixo você tem o vetor com as notas desses alunos. A distribuição das notas é normal.

notas = c(739, 720, 701, 702, 701, 724, 674, 658, 713, 659, 715, 675, 701, 707, 700, 661, 728, 700, 742, 699, 660, 659, 690, 685, 719, 713, 701, 660, 676, 753)

# Ao fim do ano, a média dos alunos da escola que não fizeram parte da turma especial foi 650. Considerando um alfa de 0.05, calcule se é possível rejeitar a H0 considerando que:

#H0: Xbarra = ??
#Ha: Xbarra > ??


### ESTUDO DE CASO: teste-t (esse exemplo foi retirado do livro)

#Um supermercado faz uma promoção para aumentar a média de compra de itens, que era de 25. Coleta-se uma amostra do número de itens comprados por 50 clientes que foram selecionados aleatoriamente. O vetor com esses valores encontra-se abaixo:

shoppingdata = c(30, 44, 19, 32, 25, 30, 16, 41, 28, 45, 28, 20, 18, 31, 15, 32, 40, 42, 29, 35, 34, 22, 30, 27, 36, 26, 38, 30, 33, 24, 15, 48, 31, 27, 37, 45, 12, 29, 33, 23, 20, 32, 28, 26, 38, 40, 28, 32, 34, 22)

#Considerando ?? = 0.05, avalie se a propaganda surtiu o efeito desejado pelo supermercado.



################################
### REVISÃO DOS COMANDO NO R ###
################################

#Digitar ? na frente do nome de uma função ou pacote abre o help do R, com informações sobre essa função ou pacote

## ?sd
## ?mean
## ?dplyr

#Para calcular a probabilidade de um t, usamos pt. A função t.test() realiza um teste-t.

## pt(t, df, lower.tail =) #retorna a probabilidade acumulada para um valor de t, considerando os graus de liberdade (df) e se é a partir da lower.tail ou não

## t.test(dados, mu=X, alternative =) #retorna se a média de dados é diferente de X de acordo com a diferença definida em alternative ("two.sided", "less" ou "greater")

