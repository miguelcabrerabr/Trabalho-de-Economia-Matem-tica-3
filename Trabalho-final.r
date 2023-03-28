---
title: "Trabalho Final de Matemática 3"
author: "Miguel Cabrera"
date: "2023-03-27"
output: html_document
---
```{r}
#Packages (1)
library(tidyverse)
```

```{r}
# (2)
# Definindo a quantidade de players iniciais (março/2019)
N0 <- 138633266
# Definindo quantos periodos serão simulados
sim_period <- 50
# Taxa de crescimento dos players do League of Legends
k <- 0.0014
# Criando um vetor para armazenamento dos players em cada período
players <- numeric(sim_period)
```

```{r}
# Iterar a equação de diferenças
for (t in 1:sim_period){
  players[t] <- N0[t]
  N0[t+1] = N0[t] + k*N0[t]
}
```

```{r}
#GGplotting
ggplot(data = data.frame(tempo = 1:sim_period, players = players), aes(x = tempo, y = players))+
  geom_line(color = "red")+
  xlab("Tempo(Meses)")+
  ylab("Players ativos de League of Legends")
```

```{r}
# Calculando a solução complementar
Yc <- function(t, A) A*(1+k)^t
```

```{r}
# Calculando a solução particular
Yp = function(C) rep(C, sim_period)
```

```{r}
# Solução Geral
Yg = function(sim_period, A, C) Yc(sim_period, A) + Yp(C)
```

```{r}
# Calculando a solução no cenário onde A = 138633266 e C = 0
Y <- Yg(1:sim_period, 138633266, 0)
Y
```








