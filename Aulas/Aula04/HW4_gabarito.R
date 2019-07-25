####################
#### PROBLEMA 1 ####
####################

# Você se inscreveu em uma seleção de bolsa de estudos para doutorado-sanduíche dividida em duas etapas. Na primeira etapa, serão analisados e pontuados os currículos de todos os candidatos inscritos. Na segunda etapa, os candidatos que estão no top 20% passarão por uma entrevista que decidirá quem receberá a bolsa.

# Você sabe que nos anos anteriores a média de pontos dos currículos analisados ficava sempre em torno de 275 pontos, e a distribuição dos dados seguia uma distribuição normal. O desvio-padrão é geralmente de 30. Você analisa seu currículo e percebe que tem 310 pontos. Se a distribuição desse ano for próxima à observada nos anos anteriores, você tem chances de ser selecionado(a) para a próxima etapa?

meu.cv = 310
media.cvs = 275
dp.cvs = 30

z.cv = (meu.cv - media.cvs)/dp.cvs

pnorm(z.cv, lower.tail = F)

####################
#### PROBLEMA 2 ####
####################

# A coordenação de uma escola diz à direção que gostaria de testar uma nova técnica de ensino para as aulas de redação. Como a escola está poupando recursos, a direção faz a seguinte proposta: se ao fim do ano a coordenação conseguir demonstrar que a nova técnica aumentaria a nota dos alunos no ENEM, a escola se compromete a custear a implementação do projeto e o treinamento dos professores.

# A direção passa os dados das notas dos alunos no ENEM dos últimos anos. A média é 650, com desvio-padrão de 25. A coordenação seleciona um aluno para ter aulas com a nova técnica de ensino, e ao fim do ano percebe que sua nota na redação foi de 698. 

# Considerando um alfa de 0.05, a coordenação consegue usar o desempenho desse aluno para convencer a direção a investir na nova técnica de ensino?

nota.aluno = 698
media.enem = 650
dp.enem = 25

z.nota = (nota.aluno - media.enem)/dp.enem

pnorm(z.nota, lower.tail = F)

#PS: perceba que há um problema com esse exercício. O aluno selecionado poderia já ter notas muito acima da turma, o que faria com que um resultado pouco provável na distribuição dos anos anteriores não seja um efeito da nova técnica de ensino. É por isso que conduzimos nossas análises a partir de uma amostra, e não a partir da seleção de apenas uma observação.A própria seleção da amostra requer cuidados que serão discutidos na próxima aula.

####################
#### PROBLEMA 3 ####
####################

# Dois colegas têm opiniões opostas sobre o efeito que a quantidade de horas de videogame na infância pode causar no QI de uma pessoa. Maria diz que o jogo exercita as funções cognitivas, e portanto teria um efeito positivo no QI. Sueli diz que o jogo limita as experiências dos indivíduos e, portanto, teria um efeito negativo. Maria diz que passou a infância todo jogando ao menos 4 horas de videogame por dia. As duas decidiram que ela deveria fazer um teste de QI para testar a hipótese de que o QI é afetado pelo uso do videogame. Maria faz esse teste e tira 125. Sabendo que a pontuação em testes de QI segue uma  distribuição normal de média igual a 100 e desvio-padrão de 15, calcule a probabilidade de o uso de videogame afetar a performance de uma pessoa em testes de QI.    

#   Você deverá
##  a) Escrever por extenso a Hipótese Nula
##  b) Fazer um teste de hipótese considerando alfa = 0.05
##  c) Escrever a resposta por extenso dizendo o que seus resultados dizem sobre a rejeição ou não da Hipótese nula

## DICA: dê uma boa lida no texto sobre testes bicaudais (ou "two-tailed tests")

# H0: Alta exposição a video-game não altera a distribuição de pontuações em testes de QI
# HA: Alta exposição a video-game altera a distribuição de pontuações em testes de QI

IQ.maria = 125
IQ.media = 100
IQ.dp = 15

z.IQ.maria = (IQ.maria - IQ.media)/IQ.dp

pnorm(z.IQ.maria, lower.tail = F)

#RESPOSTA: A hipótese nula a ser testada é de que o videogame não afeta a distribuição de pontuações em testes de QI. Contudo, não se assume a priori qual o sentido do efeito: se aumentar ou diminuir a média dessa distribuição. Portanto, devemos considerar ambas as possibilidades e, para um teste com alfa = 0.05, NÃO podemos rejeitar a hipótese nula com os dados que temos. Seria necessário que p fosse menor que 0.025 na cauda inferior ou superior para rejeitar H0.