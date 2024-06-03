---
title: "Covid_analysis"
author: "Me"
date: "2024-06-02"
output: html_document
---

#Importing libraries
```{r}
pkg<-c('tidyverse','modelr','DESeq2','EnhancedVolcano')
lapply(pkg,library,character.only=TRUE)
```

#Importing data
```{r}
dat<-read_delim('GSE234207_PMN_Project_consolidate.counts.txt')
View(dat)
```
```{r}
dat[is.na(dat)] <- 0
```

#Data clean up
```{r}
h<-rep('Healthy Control',11)
i<-rep('ICU',12)
w<-rep('Ward',12)
labels<-c(h,i,w)
```

#Making design table
```{r}
design<-tibble(
  dy=c('E20','E21','E22','E23','E24','E25',
         'E26','E27','E28','E29','E30','E31',
         'E32','E33','E34','E35','E36','E37',
         'E38','E39','E40','E41','E42','E43',
         'E44','E45','E46','E47','E48','E49',
         'E50','E51','E52','E53','E54'),
  l=labels
)
```

#Obtaining the metadata
```{r}
mdat = data.frame(id=design$dy,type=labels)
```

```{r}
profiles<-dat[,design$dy]
```
#Volcano plot
```{r}
dds =DESeqDataSetFromMatrix(round(profiles), 
                                  mdat, 
                                  ~type)
```

```{r}
dds <- DESeq(dds)
```

```{r}
res=results(object = dds, contrast = c('type','Healthy Control','ICU'),
            pAdjustMethod = 'holm', alpha = 0.000001)
```

```{r}
EnhancedVolcano(res,
                lab = dat$ensembl_transcript_id_version,
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 10e-7,
                FCcutoff = 2.5,
                xlim = c(-5.7, 5.7),
                ylim = c(0, -log10(10.2e-12)),
                pointSize = 1.3,
                labSize = 2.6,
                title = 'The results',
                subtitle = 'Differential expression analysis',
                caption = 'log2fc cutoff=1.333; p value cutof=10e-6',
                legendPosition = "right",
                legendLabSize = 14,
                col = c('lightblue', 'orange', 'blue', 'red2'),
                colAlpha = 0.6,
                drawConnectors = TRUE,
                hline = c(10e-8),
                widthConnectors = 0.5)
```
