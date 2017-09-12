#Reading features. This data set is going to use later to give meaningful 
#names to the columns in the man data frame

features<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/features.txt")
features$name<-paste(features$V1,"_",features$V2)
f_names<-features[[3]]

#**********************Reading test data*********************************************
#Reading Test Subjects
subject_test<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/test/subject_test.txt")
#Reading Test Activities
y_test<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/test/y_test.txt")
#Reading Test Measures
x_test<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/test/X_test.txt")

###Creating a 1 column data frame to integrate later to the test data frame. 
###This columns indicates the type of the data, in this case is test data
#type_test<-data.frame(rep('test',nrow(x_test)))

#Giving a meaningfull name to the data sets that are going to integrate the Test Data later
names(subject_test)<- c('Subject')
names(y_test)<-c('Activity')
#names(type_test)<-c('Type')
names(x_test)<-f_names
#***************************************************************************************

#**********************Reading training data*********************************************
#Reading Training Subjects
subject_train<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/train/subject_train.txt")
#Reading Test Activities
y_train<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/train/y_train.txt")
#Reading Test Measures
x_train<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/train/X_train.txt")

###Creating a 1 column data frame to integrate later to the training data frame. 
###This columns indicates the type of the data, in this case is training data
##type_train<-data.frame(rep('train',nrow(x_train)))

#Giving a meaningfull name to the data sets that are going to integrate the Train Data later
names(subject_train)<- c('Subject')
names(y_train)<-c('Activity')
#names(type_train)<-c('Type')
names(x_train)<-f_names
#********************************************************************

#Binding columns to integrate Subject, Activity and Measures for Test and Train Data
#Consolidating , Subject Test, Activity Test and Test Measures in 1 Test Data Frame
test_data<-cbind(subject_test,y_test,x_test)
#Consolidating , Subject Train, Activity Train and Train Measures in 1 Train Data Frame
train_data<-cbind(subject_train,y_train,x_train)

#Merging Test and Train Data
all_data<-rbind(test_data, train_data)


mean_var<-all_data[,grepl("mean()",names(all_data))]
std_var<-all_data[,grepl("std()",names(all_data))]
subject<-data.frame(SBJ=all_data$Subject)
activity<-data.frame(ACT=all_data$Activity)
activity$ACT_LBL<-factor(subject$ACT,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

final_set<-cbind(all_data$Subject,activity$ACT_LBL,mean_var, std_var)

names(final_set)[names(final_set)=="all_data$Subject"]<-"Subject"
names(final_set)[names(final_set)=="activity$ACT_LBL"]<-"Activity"

final_set_means<-aggregate(final_set[,3:ncol(final_set)],list(final_set$Subject,final_set$Activity),mean)

