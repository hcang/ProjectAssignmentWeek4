#Step 1 Downloading and Extracting the data set
library(dplyr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "UCI HAR Dataset.zip"
if (!file.exists(file)){
  download.file(fileURL,file,mode="wb")
  }
path <- "UCI HAR Dataset"
if(!file.exists(path)){
  unzip(file)
}
#reading files training and testing
trainSubj <- read.table(file.path(path, "train", "subject_train.txt"))
trainVal <- read.table(file.path(path, "train", "X_train.txt"))
trainAct<- read.table(file.path(path, "train", "Y_train.txt"))
testSubj <- read.table(file.path(path,"test","subject_test.txt"))
testVal <- read.table(file.path(path,"test","X_test.txt"))
testAct <- read.table(file.path(path,"test","Y_test.txt"))

#merging training and test data
UCIdata <- rbind(cbind(trainSubj,trainVal,trainAct),cbind(testSubj,testVal,testAct))

#renaming the columns
features <- read.table(file.path(path,"features.txt"),as.is = T)

colnames(UCIdata) <- c("Subject",features[,2],"Activities")

#getting columns with only mean and std. deviation
columnstokeep <- grep("Subject|Activities|mean|std",colnames(UCIdata))
tidyUCIdata <- UCIdata[,columnstokeep]
tidyUCIdata

#Use descriptive activity names to name activities in the data set
activities <- read.table(file.path(path,"activity_labels.txt"))
activities
tidyUCIdata$Activities <- factor(tidyUCIdata$Activities,levels=activities[,1],labels = activities[,2])
tidyUCIdata$Activities
colnames(tidyUCIdata)

#label the columns properly
tidycolname <- colnames(tidyUCIdata)
tidycolname <- gsub("[()-]","",tidycolname)
tidycolname <- gsub("^f","frequencyDomain",tidycolname)
tidycolname <- gsub("^t","timeDomain",tidycolname)
tidycolname <- gsub("Acc","Accelerometer",tidycolname)
tidycolname <- gsub("Gyro","Gyroscope",tidycolname)
tidycolname <- gsub("Mag","Magnitude",tidycolname)
tidycolname <- gsub("Freq","Frequency",tidycolname)
tidycolname <- gsub("mean","Mean",tidycolname)
tidycolname <- gsub("std","standardDeviation",tidycolname)
colnames(tidyUCIdata) <- tidycolname

#creating a new tidy data set according to mean of each activity and each subject

tinyMeanUCIdata <- summarise_each(group_by(tidyUCIdata,tidyUCIdata[,1],tidyUCIdata[,81]),funs(mean))
write.table(tinyMeanUCIdata,"	",row.names = FALSE)


