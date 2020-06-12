#I've set the "getdata_projectfiles_UCI HAR Dataset" main folder as the working directory

#Loading datasets
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
f<-read.table("./UCI HAR Dataset/features.txt")
actlab<-read.table("./UCI HAR Dataset/activity_labels.txt")

#Setting activity labels & feature names to the test dataset
colnames(subject_test)<-c("Subject")
colnames(X_test)<-f$V2
Y_test$V1<-actlab$V2[Y_test$V1]
colnames(Y_test)<-c("Activity")
#Merging the test datasets
test<-cbind(subject_test,Y_test,X_test)

#Setting activity labels & feature names to the train dataset
colnames(subject_train)<-c("Subject")
colnames(X_train)<-f$V2
Y_train$V1<-actlab$V2[Y_train$V1]
colnames(Y_train)<-c("Activity")
#Merging the train datasets
train<-cbind(subject_train,Y_train,X_train)

#final merging of test and train datasets
final<-rbind(train,test)

#Extracting only the measurements on the mean and standard deviation for each measurement
# I've selected values having only 'mean()' and 'std()' in their names.
std<-f[grep("std()",f$V2),]
mean<-f[grep("mean()",f$V2,fixed=TRUE),]
final1<-final[,colnames(final)%in%std$V2|colnames(final)%in%mean$V2]
final1<-cbind(final[,1:2],final1)

#Tidy dataset with the average of each variable for each activity and each subject
library(dplyr)
tidydata<-final1%>%group_by(Activity,Subject)%>%summarise_all(funs(mean))
write.table(tidydata,file="TidyData.txt",row.names = FALSE)