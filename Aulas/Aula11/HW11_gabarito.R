#### Você já deve ter ouvido falar do problema yanni/laurel. Se não ouviu, leia aqui - https://catracalivre.com.br/geral/entretenimento/indicacao/voce-ouve-laurel-ou-yanni-audio-enigmatico-se-torna-viral-na-web/ - e aqui - https://www.nytimes.com/interactive/2018/05/16/upshot/audio-clip-yanny-laurel-debate.html.

### Muitas pessoas atribuíram o fato de se ouvir yanni ou laurel como algo dependente do hardware usado para ouvir (computador vs celular) ou do uso ou não de fones de ouvido.

### Coletamos, via twitter, os dados de 440 falantes nativos de português que ouviram yanni ou laurel. Essas pessoas responderam o que ouviam, sua idade, se ouviam no computador ou celular e se estavam ou não usando fones de ouvido. Esses dados estão na planilha "data_yl.xlsx"

## Sua tarefa será:

## Fazer um gráfico de barras para mostrar a proporção de pessoas que ouviu yanni ou laurel

library(readxl)
library(ggplot2)

data = read_excel("~/Documents/Mahayana/academics/cursos/introstatistics/Aulas/Aula11/data_yl.xlsx")

ggplot(data, aes(x=decision))+
  geom_bar(aes (y = ..count../sum(..count..)), fill = "lightblue", color ="black")+
  labs(x="O que você ouve?", y="")+
  scale_y_continuous(labels=scales::percent)+
  theme_bw()

## Fazer uma análise para decidir se houve preferência por yanni ou laurel

table = table(data$decision)
table

prop.table(table)

chisq.test(table) ### há preferência por yanni

prop.test(248, (248+192), 0.5)

## Fazer duas análises para decidir se fones de ouvido ou o hardware usado influenciaram na escolha por yanni ou laurel

## Teste 1: uso de fone de ouvido influencia a decisão?
table.earphone = table(data$decision, data$earphone)
table.earphone

prop.table(table.earphone, 2)


chisq.test(table.earphone) ## não influencia


## Teste 2: hardware influencia a decisão?
table.hardware = table(data$decision, data$hardware)
table.hardware

prop.table(table.hardware, 2)

chisq.test(table.hardware) ## não influencia
