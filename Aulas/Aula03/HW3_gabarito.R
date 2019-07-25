#DESCRIÇÃO: Um linguista testou o efeito de frequência em um experimento de decisão lexical de palavras em L2. Os participantes, falantes de português, viam uma sequência de letras, como "jsnfrt" ou "shrimp", e tinham que apertar um botão para dizer se a sequência era ou não uma palavra em inglês. O computador gravou o tempo em milissegundos que o participante levou para apertar o botão. Sabemos que palavras mais frequentes são reconhecidas mais facilmente que palavras menos frequentes. O pesquisador gostaria de ver se esse efeito também se mantem em L2, e por isso coletou os dados que você tem no conjunto "lexdec.xlsx"

#Comece a seção carregando todos os pacotes que você precisa instalar. Só para começar, já vou deixar marcado aí o pacote "readxl", pois sem ele você não tem como importar um arquivo xlsl. Se no meio da seção você lembrar de algum pacote que esqueceu de carregar, anote a linha em que vc está trabalhando, suba até o cabeçalho e coloque aqui o pacote a ser carregado. Mantenha seu código organizado!!!

library(ggplot2)
library(readxl)
library(tidyverse)
library(scales)

#Importe o conjunto de dados e dê uma olhada nele
#LEGENDA DO CONJUNTO DE DADOS:
    #### mais: tempo de resposta em milissegundos das palavras mais frequentes
    #### menos: tempo de resposta em milissegundos das palavras menos frequentes
    #### nw: tempo de resposta em milissegundos das não-palavras

setwd("~/Documents/Mahayana/academics/cursos/introstatistics/datasets/")
dados = read_excel("lexdec.xlsx")

#######Transforme o conjunto de dados em um formato longo (é sempre melhor trabalhar com esse formato no R) e renomeie as colunas para elas se chamarem tempo (que trará o tempo de resposta em ms) e frequencia (que dirá se a observação é de palavra mais frequente, menos frequente ou de não palavra). Atenção: NÃO use acentuação no nome das suas colunas

########Exclua as medidas das não palavras do seu conjunto de dados já que vc não vai usá-las

dados = dados%>%
  gather(frequencia, tempo, mais, menos, nw)%>%
  filter(frequencia != "nw")

######## Confira seu conjunto de dados
str(dados)


######Faça um histograma só das palavras mais frequentes e um só das palavras mais frequentes

#Dica 1: como você tem um arquivo de formato longo, o mais fácil é criar um conjunto de dados só com os dados de palavras mais frequente e depois um só com os dados de palavras menosfrequente. O dplyr é seu amigo! 

dados.mais = dados%>%
  filter(frequencia == "mais")

dados.menos = dados%>%
  filter(frequencia == "menos")

#Dica 2: o melhor é fazer um histograma básico primeiro, só para dar uma olhada

ggplot(dados.mais, aes(x=tempo, y=))+
  geom_histogram()

ggplot(dados.menos, aes(x=tempo, y=))+
  geom_histogram()


####### Você deve ter visto que há alguns valores extremos. Sabemos que podemos ignorar todo tempo de resposta menor que 200ms e maior que 3000ms. Faça isso no conjunto de dados e construa os histogramas de novo. Mais uma vez o dplyr é seu amigo.

dados.mais = dados%>%
  filter(frequencia == "mais", tempo > 200, tempo < 3000)

dados.menos = dados%>%
  filter(frequencia == "menos", tempo > 200, tempo < 3000)

ggplot(dados.mais, aes(x=tempo, y=))+
  geom_histogram(breaks=seq(250,600, by = 10))

ggplot(dados.menos, aes(x=tempo, y=))+
  geom_histogram(breaks=seq(250,600, by = 10))

###### Descubra qual a média, a mediana, o desvio-padrão, o interquartil range, o primeiro e terceiro quartil de cada um dos grupos e descreva o que essas medidas te dizem sobre essas amostras comparativamente

dados.gerais = dados%>%
  filter(tempo > 200, tempo < 3000)

dados.gerais%>%
  group_by(frequencia)%>% 
  summarise(mediana = median(tempo), media = mean(tempo), dist.interquartil = IQR(tempo), desvio.padrao = sd(tempo))


###### Faça um boxplot mostrando a dispersão dos dois conjuntos de dados. Dica: aqui é mais negócio usar o conjunto completo para plotar eixo x e y


## Boxplot basicão
ggplot(dados.gerais, aes(x=frequencia, y=tempo))+
  geom_boxplot()

## Boxplot mais bonitinho
ggplot(dados.gerais, aes(x=frequencia, y=tempo))+
  geom_boxplot(aes(fill=frequencia))+
  labs(x="Palavras com relação à sua frequência", "Tempo (ms)")+
  theme_bw()

###### Pela sua análise, houve efeito de frequência? Que medidas evidenciam a falta ou presença desse efeito e como isso se reflete no boxplot?

#RESPOSTA: Parece haver efeito de frequência, a ser testado por uma análise estatística posteriormente, pois a média de tempo de resposta das palavras menos frequentes foi maior. Isso também pode ser atestado pela mediana, indicada pela linha mais grossa que divide o boxplot. Além disso, palavras menos frequentes resultaram em tempos de reconhecimento mais espalhados em relação à mediana, o que é evidenciado por medidas de dispersão maiores em comparação às palavras mais frequentes e à maior amplitude do boxplot. Os histogramas e os box plots indicam que a distribuição é normal.
