## Os dados de Godoy, Weissheimer e Mafra (submetido) que vimos em sala foram coletados para testar outra hipótese: a de que pronomes ambíguos seguindo sentenças com verbos no aspecto perfectivo, como em (1), teriam mais interpretação de alvo do que pronomes que seguissem eventos descritos com verbo no imperfectivo, como em (2).

#Augusto passou a bola para Rubes. Ele...
#Augusto estava passando a bola para Rubens. Ele...

#Analise o conjunto de dados e escolha um teste estatístico para testar a hipótese dos autores. Não esqueça de fazer um gráfico para ver a distribuição dos dados.

## Importar o conjunto de dados
data.pre = read.csv("~/Documents/Mahayana/academics/cursos/introstatistics/Aulas/Aula13/godoy_et_al.csv")

## Filtrar os dados
data = data.pre%>%
  filter(interpretation=="source"|interpretation=="goal")%>%
  droplevels()

## Fazer gráfico para ver a distribuição

ggplot(data, aes(x = verbaspect, fill = interpretation)) +  
  geom_bar(aes( y = (..count..)/sum(..count..)), color = "black") +
  scale_y_continuous(labels=scales::percent)+
  scale_fill_manual("Pronome pleno", values = c("source"= "light blue", "goal" = "#2b8cbe"),                           labels=c("fonte", "alvo"))+
  labs(x = "Aspecto verbal", y = "Frequência de realização")+
  theme_bw()

##Conferir o nível das variáveis
levels(data$interpretation)

##Criar e ver o resultado do modelo

modelo = glm(interpretation ~ verbaspect, data, family = binomial)

summary(modelo)

## Não é preciso fazer análises post-hoc pois a variável tem apenas dois níveis, e o resultado do modelo já nos dá a comparação que queríamos fazer (imperfectivo x perfectivo)

## Resposta: Ajustamos um modelo de regressão logística com a interpretação do pronome ambíguo como variável dependente e o aspecto verbal como variável independente. Os resultados indicam que a proporção de interpretação como alvo para sentenças com verbos no perfectivo foi significativamente menor do que para sentenças de verbo imperfectivo (Estimate* = -1.2843, z = -8.569, p < 0.0001).

##*em vez de "estimate", usamos a letra grega beta. aqui escrevemos "estimate" pq não há como inserir essa letra em um arquivo de extensão .R.