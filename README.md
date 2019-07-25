# APRESENTAÇÃO DO CURSO

Este material foi preparado para acompanhar o curso *Análise e Visualização de Dados quantitativos em Linguística*, que costumo oferecer no Programa de Pós-graduação em Linguística da UFRN.

O curso é também uma introdução ao *R*, pensado para quem ainda não conhece a ferramenta.

Muitas das aulas fazem uso de conjuntos de dados provenientes de outros cursos que estão gratuitamente disponíveis na internet. Todos esses cursos estão linkados nos slides. Caso decida usar algum dos conjuntos de dados disponibilizados aqui, lembre-se de citar a fonte original!

Como esse é um curso introdutório, não é possível abarcar todas as ferramentas utilizadas para análise de dados. Também não é possível cobrir todos os tópicos exaustivamente. Se você notar algum erro ou inconsistência no material, por favor me avise: @mahagodoy no twitter ou mahayanag [] gmail.

## Como usar o material

O material das aulas está na pasta *Aulas*, e os conjuntos de dados utilizados ao longo de todo o curso estão na pasta *dataset*.

Exceto pela Aula 1, as aulas costumam ter ao menos dois tipos de arquivos.

- AulaX.html: slides da aula 

	Como os slides são material de um curso presencial, algumas vezes eles ficam descontextualizados ou pouco claros. No entanto, é possível seguir o curso a partir deles na maior parte do tempo, principalmente se acompanhados da leitura sugerida.

- AulaX_macos.R ou AulaX_windows.R: tutorial 

	Tutoriais de cada uma das aulas, codificadas para uso em MacOS ou Windows. É altamente recomendado que os slides das aulas sejam acompanhados com os tutoriais.  arquivos são a base do curso. 


Algumas aulas ainda terão mais dois tipos de arquivos:

- HWX_macOS ou HWX_windows: arquivo com lição de casa para praticar os códigos e conteúdos da aula

- HWX_gabarito: arquivo com as respostas das lições de casa

 


## Conteúdo


- **Aula 1**

*Estatística*: Introdução, tipos de variáveis

- **Aula 2**

*Estatística*: descrição, medidas de tendência central

*Visualização*: Histograma

*R*: instalar e carregar pacotes, funções básicas, ggplot

*Bibliografia*: Hinton, Cap. 1 e 2

- **Aula 3**

*Estatística*: descrição, medidas de dispersão

*Visualização*: Boxplot

*R*: usando dplyr para manipulação de dados

*Bibliografia*: Hinton, Cap. 1 e 2

- **Aula 4**

*Estatística*: z-score, a distribuição normal, teste de hipóteses e tipos de erro

*R*: ggplot, pnorm

*Bibliografia*: Hinton, Cap. 3 e 4

- **Aula 5**

*Estatística*: amostragem, teorema central do limite, teste-t com uma amostra

*R*: t.test()

*Bibliografia*: Hinton, Cap. 5 e 6

- **Aula 6**

*Estatística*: teste-t com uma amostra, teste-t com duas amostras, assumptions do teste-t

*Visualização*: histogramas e boxplot com as funções básicas do R

*R*: hist(), boxplot(), t.test()

*Bibliografia*: Hinton, Cap. 7 e 8

- **Aula 7**

*Oficina prática*: organização de dataset, avaliando normalidade e tomando decisões para análise de dados.

*R*: dplyr, log(), t.test() 

*Bibliografia*: Nuzzo, 2015 

- **Aula 8**

*Estatística*: distribuição F, análise de variância (one-way ANOVA)

*R*: anova(), p.adjust()

*Bibliografia*: Hinton, Cap. 10 e 11; Leitura complementar: Winter (2011)

- **Aula 9**

*Estatística*: modelos lineares - correlação

*Visualização*: gráficos de dispersão

*R*: cor.test()

*Bibliografia*: Hinton, Cap. 20 (excluindo seção sobre linear regression)

- **Aula 10**

*Estatística*: modelos lineares

*R*: lm()

*Bibliografia*: Winter (2015, tutorial 1, p. 1-12)

- **Aula 11**

*Estatística*: distribuição binomial e dados categóricos

*Visualização*: gráfico de barras

*R*: table(), prop.table() (tabelas de contingência e proporção), chisq.test()

*Bibliografia*: Oushiro (2017, testes de proporção e qui-quadrado)


- **Aula 12**

*Estatística*: qui-quadrado; revisão de testes

*Visualização*: gráfico de barras com mais de uma variável

- **Aula 13**

*Estatística*: regressão logística e logodds

*R*: glm(); emmeans()

*Bibliografia*: Oushiro (2017, Regressão Logística - Parte 1)

## Referências



HINTON, P. (2004) Statistics Explained, 2nd Edition, 2004.

NUZZO, R. (2015) How scientists fool themselves. In: Nature, Out 2015. Acesso em fevereiro de 2018 <https://www.nature.com/news/how-scientists-fool-themselves-and-how-they-can-stop-1.18517>.

OUSHIRO, L. (2017). Introdução à Estatística para Linguistas, v.1.0.1 (dez/2017). Disponível em DOI < http://rpubs.com/oushiro/iel>.

xkcd. Significant. Disponível em < https://xkcd.com/882/>

WINTER, B. (2015) Linear models and linear mixed effects model in R with linguistics applications. Acesso em fevereiro de 2018 <http://www.bodowinter.com/tutorials.html>.

WINTER, B. (2011) The F distribution and the basic principle behind ANOVAs. Acesso em fevereiro de 2018 < http://www.bodowinter.com/tutorials.html >.




w