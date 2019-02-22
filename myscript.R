x <- 2
cats <- data.frame(coat = c("calico","black","tabby"),weight=c(2.1,3.4,5.6),likes_string=c(1,0,1))
write.csv(x=cats,file="data/feline-data.csv",row.names = FALSE)
cats<-read.csv(file="data/feline.csv")
cats
cats$weight
cats$coat
#we discover weight 2kg light
cats$weight+2
paste("my cat is",cats$coat)
typeof(cats$weight)
typeof(cats$coat)

x<-1+4i
typeof(x)
file.show("data/feline2.csv")
cats<-read.csv(file="data/feline2.csv")
str(cats$coat)



my_vector<-vector(length=3)
my_vector
another_vector<-vector(mode='character',length=3)
another_vector
str(another_vector)
str(cats$weight)
combine_vector<-c(2,6,3)
combine_vector
quiz_vector<-c(2,6,"3")
quiz_vector
character_vector<-c('2','4','6')
character_vector
character_coerce_to_logic <- as.logical(character_vector)
character_coerce_to_logic
cats$like
cats$like_coerce_to_logic <- as.logical(cats$like)
cats$like_coerce_to_logic


ab_vector<-c("a","b")
ab_vector
combine_example<-c(ab_vector,"swc")
combine_example

MySeries<-1:10
MySeries
seq(10)
seq(1,10,by=0.1)
vector2<-seq(10)
head(vector2,n=4)


str(cats$likes_string)
str(cats$coat)
coats <- c('tabby','tortoiseshell','tortoiseshell','black','tabby')
str(coats)
age <- c(2, 3, 5,12)
cbind(coats,cats,age)
cats
str(cats)

cats[-4,-5]
cats[-4,-5]
cats[ ,-4]
cats[ ,-5]
read.csv('data/feline-data.csv')
cats<-read.csv('data/feline-data.csv')
age <- c(2,3,5)
age
cats <- cbind(cats,age)
cats
newRow<-list("tortoiseshell",3.3,TRUE,9)
newRow
cats<-rbind(cats,newRow)
levels(cats$coat) <- c(levels(cats$coat),"tortoiseshell")
cats
levels(cats$coat)
cats
cats$coat <- as.character(cats$coat)
cats
str(cats)

human_age <- cats$age*7
typeof(human_age)
levels(human_age)
human_age<-factor(human_age)
levels(human_age)
human_age<-as.character(human_age)
human_age<-as.numeric(human_age)
human_age<- human_age/7
human_age






















