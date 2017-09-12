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

#Giving a meaningfull name to the data sets that are going to integrate the Test Data later
names(subject_test)<- c('Subject')
names(y_test)<-c('Activity')
names(x_test)<-f_names
#***************************************************************************************

#**********************Reading training data*********************************************
#Reading Training Subjects
subject_train<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/train/subject_train.txt")
#Reading Test Activities
y_train<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/train/y_train.txt")
#Reading Test Measures
x_train<-read.table("Data_Cleaning/Course_Project/UCI_HAR_Dataset/train/X_train.txt")

#Giving a meaningfull name to the data sets that are going to integrate the Train Data later
names(subject_train)<- c('Subject')
names(y_train)<-c('Activity')
names(x_train)<-f_names
#********************************************************************

#Binding columns to integrate Subject, Activity and Measures for Test and Train Data
#Consolidating Subject Test, Activity Test and Test Measures in 1 Test Data Frame
test_data<-cbind(subject_test,y_test,x_test)
#Consolidating Subject Train, Activity Train and Train Measures in 1 Train Data Frame
train_data<-cbind(subject_train,y_train,x_train)

#Merging Test and Train Data
all_data<-rbind(test_data, train_data)

#Looking for all the mean and standard deviation measures
mean_var<-all_data[,grepl("mean()",names(all_data))]
std_var<-all_data[,grepl("std()",names(all_data))]

#Storing subject in a single column data frame
subject<-data.frame(SBJ=all_data$Subject)
#Storing activity in a single column data frame and giving a meaningful name
activity<-data.frame(ACT=all_data$Activity)
activity$ACT_LBL<-factor(activity$ACT,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

#Creating a dinal data set binding Subject, activity (with meaningful names), and mean & sd measures
final_set<-cbind(subject$SBJ,activity$ACT_LBL,mean_var, std_var)

#Cleaning the subject and activity column names
names(final_set)[names(final_set)=="subject$SBJ"]<-"Subject"
names(final_set)[names(final_set)=="activity$ACT_LBL"]<-"Activity"

#Aggregating to calculate average, grouping by Subject and Activity
tidy_data<-aggregate(final_set[,3:ncol(final_set)],list(final_set$Subject,final_set$Activity),mean)

#Cleaning the subject and activity column names
names(tidy_data)[names(tidy_data)=="Group.1"]<-"Subject"
names(tidy_data)[names(tidy_data)=="Group.2"]<-"Activity"

order(tidy_data,tidy_data$Subject,tidy_data$Activity)