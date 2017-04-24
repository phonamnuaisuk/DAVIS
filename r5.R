#
# Text Mining
#
text.rt <- readLines("http://kdd.ics.uci.edu/databases/reuters21578/README.txt")
length(text.rt)
# examine
text.rt
which(text.rt == "")
# clean up 
text.rt <- text.rt[- which(text.rt=="")]
length(text.rt)
text.rt <- text.rt[- which(text.rt=="}")]
length(text.rt)
#
lastind <- which(text.rt=="X. Bibliography")-1
text.rt <- text.rt[1:lastind]
#
text.rt <- gsub(pattern = "\"",replacement = "", x = text.rt, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
text.rt
#
library(tm)
txt <- VectorSource(text.rt)
txt.corpus <- Corpus(txt); rm(txt)
txt.corpus
inspect(txt.corpus)
#
txt.corpus <- tm_map(txt.corpus, tolower)
txt.corpus <- tm_map(txt.corpus, removePunctuation)
txt.corpus <- tm_map(txt.corpus, removeNumbers)
txt.corpus <- tm_map(txt.corpus, removeWords, stopwords("english"))
txt.corpus <- tm_map(txt.corpus, stemDocument)
txt.corpus <- tm_map(txt.corpus, stripWhitespace)
inspect(txt.corpus)
tdm <- TermDocumentMatrix(txt.corpus)
inspect(tdm)
#
library(wordcloud)
wordcloud(txt.corpus)
#
freq.terms <- findFreqTerms(x = tdm, lowfreq = 10, highfreq = Inf)
terms.freq <- rowSums(as.matrix(tdm))
terms.freq <- subset(terms.freq, terms.freq >=20)
df <- data.frame(term=names(terms.freq), freq = terms.freq)
library(ggplot2)
ggplot(df,aes(x=term,y=freq))+ geom_bar(stat="identity")+ xlab("Terms") + ylab("Counts") + coord_flip()
#
tdm2 <- removeSparseTerms(tdm, sparse=0.95)
m2 <- as.matrix(tdm2)
distm2 <- dist(scale(m2))
fit <- hclust(distm2, method="ward.D")
plot(fit)

###############################################

library(tm)
#library(SnowballC)
reut21578 <- system.file("texts", "crude", package = "tm")
reuters <- VCorpus(DirSource(reut21578), readerControl = list(reader = readReut21578XMLasPlain))
reuters
# inspect
inspect(reuters[1:3])
inspect(reuters[[1]])
meta(reuters[[1]],"id")
#
# getwd()
#setwd("C:/Users/My HP/Desktop/05Teaching/CRC5VIS/_Lectures/R-exercises/reutersdata")
#writeCorpus(text.corpus)
#
reuters <- tm_map(reuters, removePunctuation)
inspect(reuters[[1]])
reuters <- tm_map(reuters, stripWhitespace)
inspect(reuters[[1]])
reuters <- tm_map(reuters, content_transformer(tolower))
inspect(reuters[[1]])
reuters <- tm_map(reuters, removeNumbers)
inspect(reuters[[1]])
reuters <- tm_map(reuters, removeWords, stopwords("english"))
inspect(reuters[[1]])
reuters <- tm_map(reuters, stemDocument)
inspect(reuters[[1]])
reuters
dtm <- DocumentTermMatrix(reuters)
inspect( dtm[5:10,640:650])
#
tdm <- TermDocumentMatrix(reuters)
inspect( tdm[640:650,5:10])
#
findFreqTerms(x = tdm, lowfreq = 10, highfreq = Inf)
#
findAssocs(x = tdm, term = "accord", corlimit = 0.6)
#
tdm.common.70 <- removeSparseTerms(x=tdm, sparse=0.7)
tdm.common.20 <- removeSparseTerms(x=tdm, sparse=0.2)

#
freq.terms <- findFreqTerms(x = dtm, lowfreq = 10, highfreq = Inf)
terms.freq <- rowSums(as.matrix(dtm))
terms.freq <- subset(terms.freq, terms.freq >=15)
df <- data.frame(term=names(terms.freq), freq = terms.freq)
library(ggplot2)
ggplot(df,aes(x=term,y=freq))+ geom_bar(stat="identity")+ xlab("Terms") + ylab("Counts") + coord_flip()
#
#
findAssocs(x = dtm, term = "oil", corlimit = 0.9)
#
dtm.common.70 <- removeSparseTerms(x=dtm, sparse=0.7)
dtm.common.20 <- removeSparseTerms(x=dtm, sparse=0.2)
inspect(dtm)


#
library(wordcloud)
wordcloud(reuters)
#
tdm2 <- removeSparseTerms(tdm, sparse=0.6)
m2 <- as.matrix(tdm2)
distm2 <- dist(scale(m2))
fit <- hclust(distm2, method="ward.D")
plot(fit)
#############################################
setwd("C:/Users/My HP/Desktop/05Teaching/CRC5VIS/_Lectures/R-exercises/")
text.comb <- readLines("wikipedia/textmining/_COMB.txt")
length(text.comb)
#text.comb <- gsub(pattern = "and",replacement = "", x = text.comb, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#text.comb <- gsub(pattern = "are",replacement = "", x = text.comb, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#text.comb <- gsub(pattern = "for",replacement = "", x = text.comb, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#text.comb <- gsub(pattern = "not",replacement = "", x = text.comb, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#
library(tm)
txt <- VectorSource(text.comb)
txt.corpus <- Corpus(txt); rm(txt)
txt.corpus
inspect(txt.corpus[1])
#txt.corpus <- tm_map(txt.corpus, removeWords, stopwords("english"))
#inspect(txt.corpus[1])

tdm <- TermDocumentMatrix(txt.corpus, control = list(removePunctuation = TRUE,stopwords = TRUE,tolower = TRUE,stemming = TRUE,removeNumbers = TRUE,bounds = list(global = c(3, Inf)))) 
inspect(tdm)
#
library(wordcloud)
wordcloud(txt.corpus)
#
freq.terms <- findFreqTerms(x = tdm, lowfreq = 10, highfreq = Inf)
terms.freq <- rowSums(as.matrix(tdm))
terms.freq <- subset(terms.freq, terms.freq >=10)
df <- data.frame(term=names(terms.freq), freq = terms.freq)
library(ggplot2)
ggplot(df,aes(x=term,y=freq))+ geom_bar(stat="identity")+ xlab("Terms") + ylab("Counts") + coord_flip()
#
#############################################

dtm <- as.DocumentTermMatrix(tdm)
library(topicmodels)
lda <- LDA(dtm,k=5)
trmtop = terms(lda,5)
trmtop
