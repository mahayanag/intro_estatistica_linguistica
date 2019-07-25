## A lição de casa hoje é mais um tutorial do que uma atividade prática. As respostas já estão dadas, mas são discutidas algumas questões que não chegamos a aboardar em aula; por isso, é importante que você estude esse documento.

### O arquivo est0113.csv traz os dados de altura, número de calçado, nota do ENEM e várias outras variáveis dos alunos que cursaram est0113 na UFRN entre os anos de 2015 e 2018.

## Vamos ajustar um modelo linear para verificar a hipótese de que altura e gênero conseguem prever o número de calçado de uma pessoa.

## Pacotes que vamos usar

library(ggplot2)
library(dplyr)


#importe o conjunto de dados (abaixo eu estou com o caminho para o arquivo no meu computador; vocês tem que indicar o do seu computador)
data = read.csv("~/Documents/Mahayana/academics/cursos/introstatistics/Aulas/Aula10/est0113.csv")

## Vamos conferir o nome das variáveis
str(data)

## Vamos uma ideia de qual a média e a cara das variáveis numéricas que vamos avaliar; já vismo que gênero tem duas variáveis: masculino e feminino

mean(data$altura)

hist(data$altura) ## dados normais

mean(data$calcado)

hist(data$calcado) ## dados não são normais, mas o que importa para o modelo linear é a normalidade dos resíduos; vamos ver isso depois

boxplot(data$altura) ## nenhum outlier
boxplot(data$calcado) ## nenhum outlier

## Vamos ver valor mínimo e máximo de altura e calçado
min(data$altura)
max(data$altura)

min(data$calcado)
max(data$calcado)


### Vamos fazer um gráfico de dispersão para ver se não tem nada fora do previsto pelo que sabemos das alturas e calçados de homens e mulheres

ggplot(data, aes(altura, calcado))+
  geom_point(size = 3, alpha = 0.4, aes(colour = genero))+
  geom_smooth(method = "lm")+
  theme_bw()

## Tem uma mulher que calça 48?! E ela tem 1,60 de altura?! Impossível! Ou houve uma falha no preenchimento, ou ela é um caso **MUITO** particular, que não é representativo dos nossos dados. Veja que podemos dizer isso porque conhecemos como número de calçado e altura estão distribuídas na população, e portanto temos motivos que sustentam a nossa decisão de excluir esse sujeito da nossa amostra. Por isso, tenha sempre em mente que você tem que conhecer o fenômeno que está estudando para identificar possíveis casos que estão muito fora do previsto e decidir se os dados devem ser eliminados na análise quantitativa ou não. Como você pode conhecer o fenômeno? Lendo sobre ele, prestando muita atenção à sessão de métodos dos artigos que você lê!

## Vamos excluir a pessoa qu tem 1,60 e calçado 48. Não podemos simplesmente filtrar quem calça 48, pois isso nos tiraria um rapaz de 193 que calça 48 (o que é um tamanho de pé muito grande, mas não tão impossível assim pelos dados que temos; vamos dar o benefício da dúvida). Para excluir o dado que queremos, vamos especificar que é quem usa 48 *e* tem 160cm de altura, o que é feito com (calcado == 48 & genero == "Feminino"). Depois, vamos dizer que é para filtrar os dados de quem *NÃO* se encaixa nesse perfil. Para fazer isso, é só colocar ! (que indica "diferente") na frente de toda a expressão. Voilá:

data = data %>% 
  filter(!(calcado == 48 & genero == "Feminino"))

## Você deve ter visto agora que seu conjunto de dados que tinah n = 121 agora tem n = 120.

## Fazemos o gráfico novamente

ggplot(data, aes(altura, calcado))+
  geom_point(size = 3, alpha = 0.4, aes(colour = genero))+
  geom_smooth(method = "lm")+
  theme_bw()

## Pela inspeção do gráfico, dá para ver que tanto sexo quanto altura explicam o tamanho do calçado de uma pessoa. Só agora, depois de termos explorado bem os nossos dados, vamos construir um modelo para testar nossa hipótese:

model = lm(calcado ~ genero + altura, data)

summary(model)

#Vamos ver se os resíduos são normais

hist(model$residuals) #são normais

## Ok, o modelo encontrou efeitos significativos de gênero e altura no tamanho da pessoa. Poderíamos reportar o resultado da seguinte maneira:

## Excluímos os dados de um participante do sexo feminino de 160cm que reportou calçar 48, pois entendemos que essa medida de calçado não é representativa da população feminina.  Considerando o conjunto de dados restante (n=120), ajustamos um modelo linear com o número de calçado como variável resposta e a altura e genero como variáveis independentes. O modelo foi significativo em explicar 79% da variação dos dados (F(2, 117) = 231.8, p < 0.0001). Os coeficientes indicam que indivíduos do sexo masculino têm calçados em média maiores que indivíduos do sexo feminino (beta = 3.02, t = 10.03, p < 0.0001), e o aumento de altura aumenta também o tamanho do calçado (beta = 0.15, t = 8.9, p < 0.0001).

#### COMENTÁRIOS ADICIONAIS

## Embora essa análise não esteja errada, veja que o intercept do seu modelo não faz o menor sentido: ele indica o tamanho do pé de uma pessoa do genero feminino com idade igual a 0 (isso é, uma pessoa não nascida...). Isso ocorre porque o intercept é o valor do eixo y quando o eixo x é igual a 0. O ideal seria que o intercept fosse informativo quanto ao valor do eixo y (o número do calçado) para a amostra que coletamos. Ou seja, o intercept deveria ser o valor de calçado previsto para os sujeitos que tem entre 150 e 193 de altura. Nós fazemos isso "centrando" o valor de altura em torno de zero. Em outras palavras, "enganamos" o modelo de modo a especificar que o valor "zero" do eixo x é, na verdade, a média da altura da nossa amostra. 

## Como fazemos isso? Simples: criamos uma nova coluna subtraindo a média da altura do vetor "altura". Assim, criaremos um novo vetor que preserva as diferenças de alturas dos participantes, mas cuja média, agora, é 0!

## Vamos criar esse novo vetor
data = data%>%
  mutate(altura.c = altura-(mean(altura)))

## Vamos tirar a sua média
mean(data$altura.c)

##Ok, a média não foi zero, foi -9.474178e-15, mas isso é praticamente zero. Esse valor corresponde a 0.000000000000009.


## Agora que nossa variável dependende está centrada, podemos rodar nosso modelo novamente, usando o novo vetor para altura. Você vai ver que os coeficientes continuarão os mesmos, exceto pelo intercept, e que a significância não sofrerá muita alteração

model.c = lm(calcado ~ genero + altura.c, data)

summary(model.c)

## Qual a vantagem de centrar a variável? Bom, agora o seu intercept diz qual deve ser o número de calçado para o valor média de altura do nível de referência (gênero feminino). Não mudou o fato de que o tamanho médio do pé do gênero masculino será 3.02 números maior que a média do pé feminino. Duvida? Vamos fazer um teste. Vamos calcular a média de altura de homens e mulheres.

data%>%
  group_by(genero)%>%
  summarise(media.altura = mean(altura))

## A média de altura é 163.17 para mulheres, e nosso modelo prevê que uma mulher com essa altura teria um pé de tamanho 37.3958 (o intercept - isso é, o valor do eixo y). Rode o código abaixo, que faz um gráfico de dispersão e indica, com linha tracejada vermelha na vertical, o valor médio da altura feminina (1,63). Outra linha vermelha, na horizontal, indica o valor previsto pela linha de regressão para o eixo y quando a altura é 1,63. Você verá que esse valor é cerca de 37.3, conforme está no intercept do modelo!

ggplot(data, aes(altura, calcado))+
  geom_point(size = 3, alpha = 0.4, aes(colour = genero))+
  geom_smooth(method = "lm")+
  geom_hline(yintercept=37.3958, linetype="dashed", color = "red", size = 0.5)+
  geom_vline(xintercept=163.1765, linetype="dashed", color = "red", size = 0.5)+
  theme_bw()

## E os participantes do gênero masculino? O modelo indicou que a diferença ocasionada pela variável gênero é tal que, considerando a altura média, um homem terá um calçado 3.07 números maiores que uma mulher. E qual a altura média de um homem na nossa amostra? 1.7410. Um homem com essa altura, deveria ter um calçado de número intercept + EstimateMasculino, isto é 37.3958 + 3.0217, ou 40.4175. Vamos ver se a linha de regressão prevê que um homem de 1.74 calce um calçado de número 40? Rode o código abaixo:

ggplot(data, aes(altura, calcado))+
  geom_point(size = 3, alpha = 0.4, aes(colour = genero))+
  geom_smooth(method = "lm")+
  geom_hline(yintercept=40.4175, linetype="dashed", color = "blue", size = 0.5)+
  geom_vline(xintercept=174.1014, linetype="dashed", color = "blue", size = 0.5)+
  theme_bw()

## Mas eu preciso mesmo centrar minha variável dependente? Em termos de testar a significância dos termos do seu modelo quando você não tem interação (aqui, "genero" e "altura"), isso não altera muita coisa em boa parte dos casos. No entanto, ao centrar nossa variável dependente o intercept se torna mais informativo, e você começa a ter uma noção um pouco melhor do que um modelo linear está fazendo. Se seu modelo tiver como variável independente a interação entre fatores, não centrar a variável resposta pode mascarar alguns efeitos, visto que o cálculo está sendo feito a partir do valor de y quando x = 0.