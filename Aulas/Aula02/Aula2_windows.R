################################################################################
########### Programa de P�s-gradua��o em Estudos da Linguagem (UFRN) ###########
########### An�lise e Visualiza��o de dados: Aula 2                  ###########
########### Profa:    Mahayana Godoy                                 ###########
################################################################################

######################
#### INFORMA��ES #####
######################

## O presente tutorial foi desenvolvido para acompanhar a Aula 2 do curso introdut�rio de An�lise e Visualiza��o de dados (PPgEL/UFRN). Por esse motivo, alguns dos comandos podem n�o ser t�o transparentes se forem realizados de forma independente.

#####################
#### INTRODU��O #####
#####################

## Tudo que for precedido pelo s�mbolo # em uma linha � classificado como  coment�rio
## Coment�rios n�o s�o entendidos como c�digo, e portanto o programa n�o tentar� execut�-los


## Essa linha � um coment�rio. A linha abaixo � um comando. Deixe o cursor (aquela barrinha vertical que fica piscando) na linha do comando que deseja executar e aperte CTRL+ENTER. Tente fazer isso com o comando da linha abaixo.
2+2


##Voc� viu o resultado da equa��o acima ser executado na janela abaixo

##Repita o comando com a equa��o abaixo
3+4

##Repita o comando com a fun��o abaixo
sqrt(4)

##Repita o comando com a fun��o abaixo
sqrt(81)

##Para executar mais de uma linha de c�digo, selecione tudo com o bot�o direito do mouse e aperte CTRL+ENTER
567+876
54*34
28-98
sqrt(121)

#Pronto, todos os c�digos acima foram executados de uma �nica vez na janela CONSOLE

#######################
## vetores e fun��es ##
#######################

#Geralmente n�o usamos o R para fazer contas simples, mas para realizar c�lculos sobre vetores. 

#Imagine que juntamos os valores pagos de aluguel por 13 estudantes que acabaram de mudar para Natal para estudar na UFRN, e com esses valores criamos o vetor "aluguel"

#N�s criamos um vetor assim:

aluguel = c(345.2, 932, 784, 1042.3, 2102.9, 917.9, 890, 732, 832, 974.4, 668.4, 1022, 1210)

#ou assim

aluguel <- c(345.2, 932, 784, 1042.3, 2102.9, 917.9, 890, 732, 832, 974.4, 668.4, 1022, 1210)

#Perceba que voc� criou um vetor chamado "aluguel" na �rea Environment.

#Suponha que eu queira saber a m�dia aritm�tica desse conjunto de dados. Que conta preciso fazer?

#soma de todos os n�meros do vetor/n�mero de observa��es no vetor

#O R � capaz de fazer isso aplicando os comandos sum() e length() no vetor aluguel.

sum(aluguel)
length(aluguel)


sum(aluguel)/length(aluguel)

soma = sum(aluguel)
n = length(aluguel)

soma/n

#Uma das vantagens do R � que ele faz essas contas sem precisarmos saber a f�rmula!

#A fun��o para calcular a m�dia de um vetor � `mean(nome do vetor)`

mean(aluguel)


## Sua vez de treinar

#Crie um vetor com as idades dos alunos da turma e

#(a) identifique a m�dia de idade da turma 
#(b) descubra quantos anos a turma tem se somarmos todas as idades

#
#
#
#
#

##No geral, n�s n�o inserimos os vetores manualmente para an�lise, mas os importamos de uma tabela.

#Vamos aprender a fazer isso no R.

#########################
## Come�ando uma se��o ##
#########################

## Instalando e carregando os pacotes

# Precisamos primeiro instalar os pacotes que vamos usar com a fun��o `install.packages()`

install.packages("readxl") #permite carregar arquivos .xls
install.packages("ggplot2") #permite gerar gr�ficos a partir de um conjunto de dados

# Vamos carregar os pacotes que iremos usar nesse curso com a fun��o `library()`

library(readxl)
library(ggplot2)

# Agora que voc� j� carregou os pacotes que precisa para fazer as an�lises desse tutorial, precisa definir sua �rea de trabalho, i.e., a pasta de onde vai importar seus conjuntos de dados. Voc� pode fazer isso clicando nos menus acima, seguindo a ordem:

#session (ou se��o) >> set working directory >> choose directory

# e vai aparecer um pop-up para indicar a pasta onde est� seu conjunto de dados. Note que vc n�o vai selecionar o conjunto de dados, voc� vai indicar a pasta onde ele est�.

# Outra maneira � indicar o caminho manualmente. No meu computador, a pasta de conjunto de dados para esse tutorial est� na pasta "datasets", e para chegar a essa pasta o caminho �

#Documents > Mahayana > academics > cursos > introstatistics > datasets

#Eu informo isso ao R atrav�s do comando setwd() da seguinte maneira:

##setwd("~/Documents/Mahayana/academics/cursos/introstatistics/datasets/")

#No windows, eu usaria um comando como 

## setwd("C:/Users/Mahayana/academics/cursos/introstatistics/datasets")

#Pessoalmente prefiro informar assim, pois mantenho minhas pastas organizadas e, daqui a meses ou anos, quando quiser rodar o c�digo, basta rodar o comando acima que ele acha o diret�rio para mim, sem que eu tenha que ficar indicando manualmente.

# Agora que informamos a �rea de trabalho, vamos importar o conjunto de dados que queremos.

# Para esse tutorial, vamos importar o conjunto "scores.xlsx", com o exemplo usado em Hinton (2004, Cap1).Esse conjunto de dados re�ne as notas dos alunos de 0 a 100 para uma disciplina de gradua��o.

# Importamos o conjunto, que � .xlsx, com a fun��o read_excel, e damos a esse conjunto de dados o nome dados.scores

dados.scores = read_excel("scores.xlsx")

# Voc� vai ver que criou um conjunto de dados chamado "dados.scores" na �rea Environment. Ele tem 100 observa��es de 1 vari�vel. Clique para v�-lo.

#Voc� tamb�m pode importar arquivos em .txt. Nesse caso, use a fun��o `read.table` e adicione � sintaxe a express�o header = TRUE para informar que a primeira linha do arquivo � o nome (header) da coluna:

## dados.scores = read.table("scores.txt,", header = TRUE)

############################
## Estat�stica descritiva ##
############################

## Conhecendo o conjunto de dados

#Quando voc� for usar uma fun��o qualquer (e.g. `f()`) para ler um vetor qualquer (e.g.,`v`) dentro de um conjunto de dados qualquer (e.g. `dataset`), sua sintaxe ser� `f(dataset$v)`

#Vamos ordenar o conjunto de dados presente no vetor scores do conjunto de dados `dados.score` com a fun��o sort(), e vamos ver quantas observa��es ele tem com a fun��o length() para ver como isso funciona:

length(dados.scores$scores)
sort(dados.scores$scores)

## Conhecendo a distribui��o do conjunto de dados

#Para conhecer a distribui��o dos nossos dados, "plotamos" a frequ�ncia dos dados em um tipo de gr�fico chamado histograma (cf. Hinton, p.19)

#No R, usamos um pacote chamado ggplot2 e a fun��o ggplot() para fazer v�rios tipos de gr�fico, inclusive histogramas.

#A sintaxe do ggplot2 �:

## ggplot(nome_do_conjunto_de_dados, aes(x = valor_que_vai_no_eixo_x, y =  valor_que_vai_no_eixo_y))

#Dica para se lembrar da sintaxe: `aes` vem de aesthetics. Ou seja, essa fun��o define a est�tica, a cara do gr�fico a partir dos vetores do conjunto de dados que estamos analisando.

## Conhecendo a distribui��o do conjunto de dados

#Vamos tentar fazer o histograma dos dados dos scores para fazer algo semelhante ao gr�fico da p�gina 19 de Hinton

ggplot(dados.scores, aes(x = scores, y = ))

# O comando acima deu erro pq vc especificou o que vai no eixo x e y (o y fica em branco por se tratar de frequ�ncia dos dados obtidos no eixo x), mas n�o indicou que tipo de gr�fico quer. Colocamos um sinal de + para indicar que o c�digo continua na linha seguinte, e � nessa linha que dizemos se queremos um histograma, um gr�fico de barras, de linhas, um boxplot etc.

ggplot(dados.scores, aes(x = scores, y = ))+
  geom_histogram()

#Queremos espalhar os dados para que cada quadradinho no gr�fico represente um valor. Queremos dizer que os valores (breaks) do histograma devem ir de 0 a 100 (`seq(0,100)`) e que as observa��es devem ser dadas em um intervalo de 1 ponto (`seq(by=1)`)

ggplot(dados.scores, aes(x = scores, y = ))+
  geom_histogram(breaks=seq(0, 100, by = 1))

## No gr�fico apresentado em aula (cf Aula2.html), voc� ter� um gr�fico mais arrumado, mas os comandos b�sicos do ggplot s�o esses que acabamos de ver

# Voc� pode comparar esse gr�fico que fez com os valores do vetor organziados em ordem crescente

sort(dados.scores$scores)

##################################
## MEDIDAS DE TEND�NCIA CENTRAL ##
##################################

# Medidas de tend�ncia central s�o �teis para identificar um resultado que representa o conjunto de dados. Algumas dessas medidas s�o:

#m�dia
#mediana
#moda

#O comando para identificar a mediana no R � median(), e para a m�dia � mean()

# A vantagem da m�dia � que ela � sens�vel a todos os pontos do conjunto de dados. No entanto, essa sensibilidade pode fazer com que seu valor n�o seja representativo do conjunto se houver uma medida muito extrema.

# A mediana � o ponto que divide o conjunto de dados na metade. A presen�a de um valor extremo alterar� pouco o valor da mediana, e � poss�vel que o valor da mediana nem mude.

# Apesar de essas medidas darem uma ideia de como s�o os dados, � FUNDAMENTAL que conhe�amos a forma da distribui��o desses dados para sabermos como analis�-los. � por isso que se aconselha que fa�amos gr�ficos como histograma antes mesmo de come�ar a an�lise.

##############
### TAREFA ###
##############

## Agora � com voc�

#Voc� tem o arquivo chamado `scorestotal.xlsx`. Nesse arquivo, voc� tem uma coluna com o conjunto de dados "presente", que acabamos de analisar, e o conjunto "passado", descrito por Hinton na p�gina 18. A coluna "presente" indica as notas obtidas no ano corrente. A coluna "passado" indica as notas obtidas no ano anterior.


#(a) Importe o conjunto de dados
#(b) Calcule as medidas de tend�ncia central para os dois anos
#(c) Fa�a um histograma dos dois anos
#(d) O que voc� pode dizer sobre as m�dias e medianas desse conjunto de dados?


#################
#### REVIS�O ####
#################

# Uma revis�o das fun��es aprendidas nesse tutorial

## install.packages() #instala um pacote
## library() #carrega um pacote
## setwd() #indica o caminho para a pasta em que est�o o conjunto de dados
## read_excel() #importa conjunto de dados em xlsx
## read.table() #importa conjunto de dados em outros formatos


## c() #cria um vetor
## sum() #soma todos os valores de um vetor
## length() #indica o n�mero de observa��es em um vetor
## mean() #indica a m�dia de um vetor
## median() #indica a mediana de um vetor
## sort() #organiza as observa��es do vetor por ordem crescente (para ordem descrescente, adicione decreasing = TRUE)


## ggplot(dados, aes(x,y)) + #indica os vetores usados para definir eixo x e y para qualquer
#tipo de gr�fico
##   geom_histogram() + #indica o tipo de gr�fico - nesse caso, um histograma 
#(mas h� geom_line, geom_boxplot, geom_bar, geom_point...)
##   labs(x = "", y = "") #personaliza o nome dos eixos x e y
