################
## PROBLEMA 1 ##
################

## Abaixo, há três problemas em que o experimentador quer decidir sobre a representatividade de uma amostra frente a um determinado valor. Analise os problemas e defina qual (ou quais) pode(m) ser resolvido(s) com um teste-t de uma amostra. Justifique por que o(s) outro(s) não poderia(m) ser resolvido com esse teste.

#A) Uma empresa está testando novos tênis de corrida. Antes de seguir com os testes finais, a equipe responsável pelo desenvolvimento do produto pediu para três atletas correrem usando esse tênis para ver se eles conseguem correr completar os 400m em uma média de 50s. Os pesquisadores anotaram o tempo de chegada de 5 corridas para cada um dos corredores, o que lhes rendeu uma amostra de 15 observações.

#B) O chefe do financeiro de um restaurante recém-inaugurado informa ao gerente que cada cliente precisa gastar em média 40 reais para que o negócio opere sem prejuízos. Para testar se o gasto está de acordo com o esperado, o gerente recolhe uma amostra do gasto de 70 clientes diferentes (10 para cada dia da semana). 

#C) Um salão de de beleza precisa fazer o novo pedido de tinta para cabelo com seu fornecedor. Para isso, ele precisa definir mais ou menos qual é a saída das cores "Loiro", "Castanho escuro", "Preto" e "Ruivo". O gerente decide que não vale a pena encomendar uma dessas cores se elas não forem procuradas por pelo menos 10% das clientes que tingem o cabelo. Para definir que cores comprar, ele seleciona uma amostra de 40 clientes que tingem o cabelo no salão e pergunta a elas qual dessas cores elas costumam usar.

## RESPOSTA: O problema A não pode ser resolvido com um teste-t pois a amostra consiste de medidas repetidas por sujeito e, portanto, seus valores não são independentes. O problema C não pode ser resolvido por um teste-t, pois a variável dependente é categórica. O problema B pode ser resolvido por um teste-t de uma amostra pois a variável dependente é uma medida contínua e os valores da amostra são independentes. Restaria apenas saber se esses valores estão distribuídos em uma distribuição normal.

################
## PROBLEMA 2 ##
################

# Abaixo você tem três problemas. Você deverá analisar cada um e decidir se é possível utilizar um teste-t para resolvê-lo (lembre-se de que isso envolve ver a distribuição dos dados). Caso seja possível, realize o teste. Caso não seja possível, explique o porquê. Não se esqueça de dar uma olhada no arquivo importado para ver o nome das colunas (você precisará informar dados$coluna para fazer os testes).

#### RESPOSTA: determinar o diretório onde estão meus datasets 

setwd("~/Documents/Mahayana/academics/cursos/introstatistics/datasets/")

#A) Uma escola que foi mal classificada no último IDEB conseguiu recursos federais para implementar um novo programa de ensino de leitura. A ideia é que, com esse programa, os alunos das séries iniciais alcancem a meta nacional do último IDEB, que foi de 5.5. O arquivo com as notas dos alunos em uma nova prova do IDEB estão no arquivo "ideb.xlsx". A partir dessa amostra, é possível usar um teste t, com alfa = 0.05, para analisar se a nova média da nota dos alunos é igual à média nacional anteriormente registrada de 5.5? Em caso positivo, escreva sua H0, Ha e faça o teste.

#H0: a média da turma é igual a 5.5
#Ha: a média da turma é inferior a 5.5

ideb = read_excel("ideb.xlsx")

mean(ideb$nota)

ggplot(ideb, aes(x=nota))+
  geom_histogram(breaks = seq(3,7,by=0.1))

t.test(ideb$nota, mu=5.5, alternative = "less")

#RESPOSTA: Não podemos rejeitar a H0 considerando um alfa de 0.05, pois p = 0.5. Portanto, concluímos que a média alcançada pela escola não é inferior à média nacional. 

#B) Uma confecção de roupas produz peças estimando a altura média da sua clientela em 175cm. Para ter certeza de que a produção é realmente adequada à clientela, o controle de qualidade da empresa coletou informações sobre a altura de 200 clientes, organizadas no conjunto de dados "altura.xlsx". A partir dessa amostra, é possível usar um teste t para analisar se a média de altura da clientela é de 175cm, considerando um alfa de 0.05? Em caso positivo, escreva sua H0, Ha e faça o teste.

#H0: a média da amostra é igual a 175cm
#Ha: a média da amostra é diferente de 175cm

altura = read_excel("altura.xlsx")

mean(altura$alturacm)

ggplot(altura, aes(x=alturacm))+
  geom_histogram()

#RESPOSTA: Não posso usar o teste-t para testar H0 pois os dados não têm uma distribuição normal.


#C) O governo decide que as montadoras de veículo podem comercializar apenas modelos cuja emissão média de um gás por km seja *inferior* a 30mg. Uma montadora realiza testes com sua frota e anota a taxa de emissão desse gás em 25 veículos. Esses dados estão no arquivo "gas.xlsx". A partir dessa amostra, é possível fazer uso de um teste t para avaliar se o modelo está de acordo com os parâmetros impostos pelo governo considerando um alfa de 0.01? Em caso positivo, faça o teste.

#H0: a média da amostra é igual a 30mg
#Ha: a média da amostra é inferior a 30mg

gas = read_excel("gas.xlsx")

mean(gas$gasmg)

ggplot(gas, aes(x=gasmg))+
  geom_histogram(breaks = seq(20, 40, by=2))


t.test(gas$gasmg, mu=30, alternative = "less")

#RESPOSTA: Não é possível afirmar que o modelo está de acordo com os parâmetros para um alfa de 0.01, pois p = 0.016. Com esse valor, não podemos rejeitar a H0, e, portanto, o modelo não cumpre os parâmetros exigidos por lei.