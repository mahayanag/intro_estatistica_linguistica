#A atividade dessa semana consiste em analisar um conjunto de dados sobre nomes de Pokémon.

#Estudos do japonês (Kawahara, 2017) identificaram que, ao nomear novos pokémons, os falantes nativos da língua preferiam usar nomes mais longos para animais em estágio pós-evolução comparativamente a um estágio pré-evolução.

#A explicação para isso seria de que pokémons pós-evolução tendem a ser percebidos como maiores, mais rápidos e fortes que as criaturas antes da evolução, e estaria em jogo algo próximo de um princípio da quantidade (quanto mais informação, maior a forma). 

# Foi feito um experimento similar em português brasileiro (Godoy et al., em andamento) e o mesmo efeito foi encontrado: nomes maiores (maior número de sílabas) para pokémons pós-evolução. Nesse caso, os autores se perguntaram se a familiaridade que os participantes do experimento têm de pokémons afetaria a diferença de tamanho das palavras entre pokémons pré e pós-evolução dada pelos participantes. A hipótese é de que aqueles falantes que conhecem melhor o universo de pokémon estariam mais sensíveis a demonstrar a diferença em evolução no nome, e portanto a diferença da média de sílabas no pokémon pós-evolução seria maior. 

#O conjunto de dados pokemon.csv tem as seguintes colunas.

#participant: (categórico, 142 níveis) cada um dos participantes do experimento
#familiarity: (numérica) familiaridade do participante com jogos e desenhos de Pokémon; escala de 1 a 7.
#pre.syl: (numérico) número médio de sílabas dada pelo participante em pokémon pré-evolução 
#pos.syl: (numérico) número médio de sílabas dada pelo participante em pokémon pós-evolução 
#syl: (numérico) a diferença entre pos.syl e pre.syl (pos.syl-pre.syl)

#Inspecione graficamente os dados e faça um teste para testar a seguinte hipótese:

#Há correlação entre a diferença da média do número de sílabas para pokémons pré e pós evolução e a familiaridade dos participantes com Pokémon.
