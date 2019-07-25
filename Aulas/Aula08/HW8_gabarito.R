## AVISO: os dados dessa aula são fictícios e o problema foi pensado por uma psicolinguista, então os sociolinguistas de plantão que perdoem, por favor, qualquer falha associada à criação desse problema.

## Sabemos (graças à sociolinguística) que o grau de escolaridade muitas vezes influencia nas taxas de realização de uma variante não-padrão: quanto menor a escolaridade, maior a taxa de realização dessa variante.
#Um sociolinguista quer testar a hipótese de que a atitude linguística com relação à variante (se a pessoa percebe aquela variante como estigmatizada ou não) também influencia nas taxas de produção de uma variante não-padrão. Segundo esse linguista, se a pessoa percebe aquela variante como estigmatizada, ela vai produzir menos aquela variante **independente** de sua escolaridade. Ou seja, pessoas com menos escolaridade produzirão mais aquela variante do que pessoas com mais escolaridade, mas, mesmo no grupo de menos escolaridade, haverá diferença entre aqueles falantes que veem essa variante com maior ou menor estigma. Como o efeito independeria de escolaridade, o mesmo ocorreria para falantes do ensino superior.

## Para testar sua hipótese, o linguista coleta dados de uma conversa informal com quase 100 participantes (ele tinha muitos doutorandos para coletar os dados...). Depois da conversa, ele aplica um questionário metalinguístico que indaga o falante sobre sua percepção em relação à variante estudada. Esse questionário permitiu classificar esse falantes em dois grupos: falantes com tinham uma percepção altamente estigmatizada da variante e falantes que tinham uma percepção de estigma mais baixa. 

## O conjunto de dados "atitude.xls" traz os dados dessa pesquisa, sumarizados em três colunas:

## taxa: (num) - taxa de realização (em %) da variante não padrão
## escolaridade: (chr) - identifica o falante como tendo ensino superior ("superior") ou médio ("medio").
## estigma: (chr) - identifica se o falante vê a variante como muito estigmatizada ("alto") ou se percebe a variante como não tão estigmatizada assim ("baixo").

##################################################################################
## TAREFA: importe o conjunto de dados e realize um teste estatístico para ver se a hipótese do nosso linguista fictício se sustenta. Escreva os resultados como se fosse um artigo.
##################################################################################
library(readxl)
library(ggplot)

data = read_excel("~/Documents/Mahayana/academics/cursos/introstatistics/Aulas/Aula8/atitude.xlsx")

## Primeiro você tem que conferir distribuição dos dados para ver sua normalidade. Vou fazer isso com você, passo a passo, para mostrar algumas funcionalidades do ggplot.

## Se vc quiser ver a distribuição por escolaridade em um boxplot, a essa altura vc já deveria saber que o código é o que temos abaixo:
ggplot(data, aes(x = escolaridade, y = taxa.naopadrao))+
  geom_boxplot()


## No entanto, não é isso que vc quer. Vc quer ver a distribuição para os quatro grupos que temos cruzando as nossas duas variáveis: ensino.medio:alto, ensino.medio:baixo, ensino.superior:alto, ensino.superior:baixo.

## Dica para fazer isso: quando coloco fill=estigma dentro da função aes(), estou dizendo o seguinte: considere o que há na coluna "estigma" e use isso para pintar (fill) o boxplot. Como seu boxplot já está dividido pelos níveis de escolaridade (superior/médio) no eixo x, a função criará mais uma divisão, por estigma, para poder aplicar o que está na função 'ggplot(data, aes(x = escolaridade, y = taxa.naopadrao, fill=estigma))'. Rode o comando abaixo para ver.
ggplot(data, aes(x = escolaridade, y = taxa.naopadrao, fill=estigma))+
  geom_boxplot()

## Você colocou a informação de "fill" no aes de geom_boxplot. Por quê? Bem, aqui é importante lembrar que aes (que vem se "aesthetics") decide qual ser a cara do gráfico com base em alguma variável do seu dataframe. Fora do aes vc pode especificar "perfumarias" como cor do gráfico, legenda, tema etc. No "aes", especificamos os valores do dataframe que irão determinar o que é mais fundamental em um gráfico: a visualização da distribiução dos dados.


## Vale a pena também fazer um histograma desses quatro grupos. Você já aprendeu a usar "facet_wrap" na aula sobre gastos de deputados (Aula 7). Aqui você pode precisa dar um facet_wrap por escolaridade e estigma para ver os quatro grupos. A ideia é a mesma que já vimos anteriormente, mas dessa vez você especifica que quer que o conjunto de dados se divida por essas duas variáveis informando as duas em "facet_wrap(~ x + y)". Tente ver abaixo:
ggplot(data, aes(x = taxa.naopadrao))+
  geom_histogram()+
  facet_wrap(~escolaridade + estigma)

### Agora que você já viu a distribuição dos dados, decida como conduzir sua análise.

## Dados normais; fazer ANOVA

modelo <- aov(taxa.naopadrao ~ escolaridade*estigma, data)

summary(modelo)

TukeyHSD(modelo)

## RESPOSTA
## Uma Two-way ANOVA com interação testou o efeito de escolaridade e percepção do estigma nas taxas de realização da variante não-padrão. Houve efeito significativo de escolaridade (F(1, 80)= 43.908, p < 0.0001) e de percepção de estigma (F(1, 80)=11.488, p = 0.001), bem como interação entre esses fatores (F(1,80)=5.87, p = 0.017). Uma análise post-hoc com um teste de Tukey identificou que o efeito da percepção de estigma só é significativo para os informantes com ensino médio (p = 0.0005), situação em que informantes com percepção mais alta de estigma produziram menores taxas do que os informantes com percepção mais baixa do estigma associado à variante. Para informantes com ensino superior, não houve diferença significativa nas taxas de produção associada à percepção de estigma (p=0.9214). O efeito de escolaridade se fez sentir tanto entre os informantes com percepção baixa do estigma (p < 0.0001) quanto com informantes que viam a forma como bastante estigmatizada (p = 0.02). Em ambas as situações, falantes com ensino superior produziam menos a forma não-padrão.
