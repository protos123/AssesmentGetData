setwd("C:/AssessmentGetData")
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, 'dataset.zip')
unzip("dataset.zip")
setwd("C:/AssessmentGetData/UCI HAR Dataset")

#Read X sets and merge them

xtest<-read.table("test/X_test.txt")
xtrain<-read.table("train/X_train.txt")

xdata<-rbind(xtest,xtrain)

#Read Y sets and merge them

ytest<-read.table("test/y_test.txt")
ytrain<-read.table("train/y_train.txt")

ydata<-rbind(ytest,ytrain)

#Read subjects and merge them
sjtest<-read.table("test/subject_test.txt")
sjtrain<-read.table("train/subject_train.txt")

sjdata<-rbind(sjtest,sjtrain)

#Read feature names and assign them to xdata

features<-read.table("features.txt")
names(xdata)<-features[,2]

#Extracts only the measurements on the mean and 
#standard deviation for each measurement.

#Using grep, all variables with mean and std are extracted, and subsetted in a
#new data frame
used<-grep("-mean\\(\\)|-std\\(\\)",names(xdata))
x.mnst<-xdata[used]


#Uses descriptive activity names to name the activities in the data set
activities<-read.table("activity_labels.txt")
ydata[,1]=activities[ydata[,1],2]
colnames(ydata)<-"activity"
colnames(sjdata)<-"subject"

dataset1<-cbind(sjdata,ydata,x.mnst)

#This is the final non tidy dataset, ordered by subject

dataset1<-dataset1[order(dataset1$subject),]
write.table(dataset1,"dataset1.txt",row.names = FALSE)
#From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.

dataset2<-aggregate(dataset1[,-c(1:2)], by=list(dataset1$subject,dataset1$activity)
                    ,mean)
colnames(dataset2)<-colnames(dataset1)
write.table(dataset2,"dataset2.txt",row.names = FALSE)
