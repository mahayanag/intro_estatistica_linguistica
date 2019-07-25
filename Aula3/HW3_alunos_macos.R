#DESCRIÇÃO: Um linguista testou o efeito de frequência em um experimento de decisão lexical de palavras em L2. Os participantes, falantes de português, viam uma sequência de letras, como "jsnfrt" ou "shrimp", e tinham que apertar um botão para dizer se a sequência era ou não uma palavra em inglês. O computador gravou o tempo em milissegundos que o participante levou para apertar o botão. Sabemos que palavras mais frequentes são reconhecidas mais facilmente que palavras menos frequentes. O pesquisador gostaria de ver se esse efeito também se mantem em L2, e por isso coletou os dados que você tem no conjunto "lexdec.xlsx"

#Comece a seção carregando todos os pacotes que você precisa instalar. Só para começar, já vou deixar marcado aí o pacote "readxl", pois sem ele você não tem como importar um arquivo xlsl. Se no meio da seção você lembrar de algum pacote que esqueceu de carregar, anote a linha em que vc está trabalhando para não esquecer, suba até o cabeçalho e coloque aqui o pacote a ser carregado. Mantenha seu código organizado!!!

### Carregar pacotes necessários
library(readxl)


#Importe o conjunto de dados e dê uma olhada nele

#LEGENDA DO CONJUNTO DE DADOS:
#### mais: tempo de resposta em milissegundos das palavras mais frequentes
#### menos: tempo de resposta em milissegundos das palavras menos frequentes
#### nw: tempo de resposta em milissegundos das não-palavras


#######Transforme o conjunto de dados em um formato longo (é sempre melhor trabalhar com esse formato no R) e renomeie as colunas para elas se chamarem tempo (que trará o tempo de resposta em ms) e frequencia (que dirá se a observação é de palavra mais frequente, menos frequente ou de não palavra). Atenção: NÃO use acentuação no nome das suas colunas



########Exclua as medidas das não palavras do seu conjunto de dados já que vc não vai usá-las



######Faça um histograma só das palavras mais frequentes e um só das palavras mais frequentes

#Dica 1: como você tem um arquivo de formato longo, o mais fácil é criar um conjunto de dados só com os dados de palavras mais frequente e depois um só com os dados de palavras menosfrequente. O dplyr é seu amigo! 


#Dica 2: o melhor é fazer um histograma básico primeiro, só para dar uma olhada


####### Você deve ter visto que há alguns valores extremos. Sabemos que podemos ignorar todo tempo de resposta menor que 200ms e maior que 3000ms. Faça isso no conjunto de dados e construa os histogramas de novo, dessa vez ajeitando o intervalo mostrado para fazer um histograma mais bonito. Mais uma vez o dplyr é seu amigo.


###### Descubra qual a média, a mediana, o desvio-padrão, o interquartil range, o primeiro e terceiro quartil das palavras mais e menos frequentes e descreva o que essas medidas te dizem sobre essas amostras comparativamente. Lembre-se: se os dados estão em formato longo, o dplyr faz isso de forma bem automática.


###### Faça um boxplot mostrando a dispersão dos dois conjuntos de dados. Dica: aqui é mais negócio usar o conjunto completo para plotar eixo x e y. Lembre-se do exemplo da aula.



###### Pela sua análise, houve efeito de frequência? Que medidas evidenciam a falta ou presença desse efeito e como isso se reflete no boxplot?
