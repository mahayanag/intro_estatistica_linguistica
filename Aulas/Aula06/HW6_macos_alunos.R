####################
## TESTE-T: geral ##
####################

## Abaixo, há três problemas em que o experimentador quer decidir sobre a representatividade de uma amostra frente a um determinado valor. Analise os problemas e defina qual (ou quais) pode(m) ser resolvido(s) com um teste-t de uma amostra. Justifique por que o(s) outro(s) não poderia(m) ser resolvido com esse teste.

#A) Uma empresa está testando novos tênis de corrida. Antes de seguir com os testes finais, a equipe responsável pelo desenvolvimento do produto pediu para três atletas correrem usando esse tênis para ver se eles conseguem correr completar os 400m em uma média de 50s. Os pesquisadores anotaram o tempo de chegada de 5 corridas para cada um dos corredores, o que lhes rendeu uma amostra de 15 observações.

#B) O chefe do financeiro de um restaurante recém-inaugurado informa ao gerente que cada cliente precisa gastar em média 40 reais para que o negócio opere sem prejuízos. Para testar se o gasto está de acordo com o esperado, o gerente recolhe uma amostra do gasto de 70 clientes diferentes (10 para cada dia da semana). 

#C) Um salão de de beleza precisa fazer o novo pedido de tinta para cabelo com seu fornecedor. Para isso, ele precisa definir mais ou menos qual é a saída das cores "Loiro", "Castanho escuro", "Preto" e "Ruivo". O gerente decide que não vale a pena encomendar uma dessas cores se elas não forem procuradas por pelo menos 10% das clientes que tingem o cabelo. Para definir que cores comprar, ele seleciona uma amostra de 40 clientes que tingem o cabelo no salão e pergunta a elas qual dessas cores elas costumam usar.


##########################
## TESTE-T: uma amostra ##
##########################


#PROBLEMA A 
# Uma escola que foi mal classificada no último IDEB conseguiu recursos federais para implementar um novo programa de ensino de leitura. A ideia é que, com esse programa, os alunos das séries iniciais alcancem a meta nacional do último IDEB, que foi de 5.5. O arquivo com as notas dos alunos em uma nova prova do IDEB estão no arquivo "ideb.xlsx". Faça o histograma dos valores da planilha para determinar se é possível usar um teste t, com alfa = 0.05, para analisar se a nova média da nota dos alunos é igual à média nacional anteriormente registrada de 5.5. Em caso positivo, escreva sua H0, Ha e faça o teste.


##PROBLEMA B
# O governo decide que as montadoras de veículo podem comercializar apenas modelos cuja emissão média de um gás por km seja *inferior* a 30mg. Uma montadora realiza testes com sua frota e anota a taxa de emissão desse gás em 25 veículos. Esses dados estão no arquivo "gas.xlsx". A partir dessa amostra, é possível fazer uso de um teste t para avaliar se o modelo está de acordo com os parâmetros impostos pelo governo considerando um alfa de 0.01? Em caso positivo, faça o teste.


#################################
## COMPARAÇÃO DE DUAS AMOSTRAS ##
#################################

#Para os dois problemas abaixo, realize um teste-t ou um teste de wilcoxon para responder às perguntas colocadas.

##PROBLEMA A
# Em aula, discutimos o conjunto Baumann.xlsx, comparando as notas obtidas pelos alunos submetidos ao método de ensino DRTA às notas obtidas pelos alunos submetidos ao método de ension tradicional (Basal). Essa experimento também testou um outro método de ensino, chamado Strat. Na tabela "Bauman_Strat.xlsl" você tem a nota obtida pelos alunos que foram submetidos ao método Basal e ao método Strat. Determine se os alunos ensinados com o método Strat obtém notas maiores que que os alunos ensinados pelo método Basal. Escreva a resposta como se você fosse publicá-la em um artigo. 


##PROBLEMA B
#Em aula, vimos o conjunto "Covariaveis.csv" (Oushiro, 2017). Use o mesmo conjunto para investigar se a variável sexo influencia na taxa de realização da concordância verbal não padrão na terceira pessoa do plural (CV3PP). Escreva a resposta como se você fosse publicá-la em um artigo. 
