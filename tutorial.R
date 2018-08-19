rm(list=ls())

#setwd("/home/group/main/894smf/private/")

## ---- dati ----
library(knitr)
library(reshape)
library(xtable)
library(car)
library(ggplot2)



# Creo le tavole
a3 <- as.data.frame(matrix(data = seq(10.1, 13.0, by=0.1), nrow = 10, ncol = 3))
a7 <- as.data.frame(matrix(data = seq(10.1, 17.0, by=0.1), nrow = 10, ncol = 7))
a10 <- as.data.frame(matrix(data = seq(10.1, 20.0, by=0.1), nrow = 10, ncol = 10))


# Creo i dataframe per i grafici
g3 <- melt(a3)
g7 <- melt(a7)
g10 <- melt(a10)


#--------------------------------------------------------------------------------------------------------------------------------------------------#

## ---- carb0100 ----
intestazione <- "
\\toprule
% riga 1
  \\multicolumn{10}{>{\\centering\\setlength{\\hsize}{9\\hsize}\\addtolength{\\hsize}{16\\tabcolsep}}X}{Unione di dieci colonne} \\\\
  \\cmidrule(lr){1-10}
% riga 2
  Periodo & \\multicolumn{9}{9}{\\lipsum[1]} \\\\ 
  \\cmidrule(lr){2-10}
% riga 3
  & & & \\multicolumn{7}{7}{\\lipsum[1]} \\\\
  \\cmidrule(lr){3-3} \\cmidrule(lr){4-10}
% riga 4
  & &  \\multirow{2}{\\linewidth}{\\centering \\emph{di cui: } sofferenze} & & 
  \\multirow{2}{\\linewidth}{\\centering Assicu- razioni, fondi pensione e altre istituzioni finanziarie} & 
  \\multirow{2}{\\linewidth}{\\centering Societa non finanziarie} & 
  \\multicolumn{4}{4}{Famiglie} \\\\
  \\cmidrule(lr){7-10}
% riga 5  
  & & & & & & & 
  \\multicolumn{1}{H}{Credito al consumo} & \\multicolumn{1}{H}{Acquisto di abitazioni \\vspace{1cm}} & \\multicolumn{1}{H}{Altri prestiti} \\\\
\\midrule
"

addtorow <- list()
addtorow$pos <- list()
addtorow$pos[[1]] <- 0
addtorow$pos[[2]] <- 0
addtorow$pos[[3]] <- 5
addtorow$pos[[4]] <- nrow(a10)

addtorow$command <- c(
  intestazione, # primo elemento di command, che va nella riga identificata dal primo elemento di pos (riga 0)
  'Italia & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 \\\\', # secondo elemento di command che va nella riga identificata dal secondo elemento di pos (riga 0)
  'Francia & & & & & & & & & \\\\', # terzo elemento di command che va nella riga identificata dal terzo elemento di pos (riga 5)
  '\\bottomrule' # quarto elemento di command che va nella riga identificata dal quarto elemento di pos (ultima riga)
)


carb0100 <- xtable(
  a10,
  #caption=c('Tavola 1.10 BAM - CARB0100'),
  #label=c('tab:a10.a'),
  align = "cLLLHHHRRRR", # inserire un valore in piu' rispetto al numero delle colonne (questo perche' xtable conta anche il rownames)
  digits=c(0,1,0,1,1,1,1,1,1,1,1) # inserire un valore in piu' rispetto al numero delle colonne (questo perche' xtable conta anche il rownames)
)

print(carb0100,
  format.args = list(big.mark = ".", decimal.mark = ","),
  include.colnames = FALSE,
  include.rownames = FALSE,
  add.to.row=addtorow,
  #floating=T, # se TRUE crea automaticamente l'ambiente \begin{table}
  floating=F, # se FALSE crea solo l'ambiente tabularx. L'ambiente table (con caption e label) va creato direttamente nel file Rnw
  tabular.environment="tabularx",
  width="\\textwidth",
  booktabs = FALSE,
  hline.after=NULL,
  caption.placement="top",
  size="\\fontsize{7pt}{8pt}\\selectfont" # rispettivamente fontsize e linespace
)


