

# **Human Activity Recognition Using Smartphones Data Analysis**

## **Project Overview**

This project focuses on demonstrating the ability to
collect, work with, and clean a dataset in the domain of Human Activity
Recognition (HAR) using data collected from smartphone sensors. The goal is to
prepare tidy data that can be used for later analysis, obtained from
experiments carried out with a group of 30 volunteers within an age bracket of
19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy
S II) on the waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant rate of
50Hz.

### **Dataset**

The data linked to from the course website represent
data collected from the accelerometers of the Samsung Galaxy S smartphone. The
dataset includes the following files:

- 'README.txt': Provides an overview of the dataset.
- 'features_info.txt': Shows information about the variables used on the
   feature vector.
- 'features.txt': A list of all features.
- 'activity_labels.txt': Links the class labels with their activity
   names.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Additional files are also present in the dataset,
which are not used in this analysis.

### **Files in the Repository**

- run_analysis.R: This
   script is responsible for performing the data preparation. Specifically,
   it does the following:
1. Merges the training and the test sets to create one dataset.
2. Extracts only the measurements on the mean and standard deviation for
   each measurement.
3. Uses descriptive activity names to name the activities in the
   dataset.
4. Appropriately labels the dataset with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each
   variable for each activity and each subject.
- CodeBook.md:
   Describes the variables, the data, and any transformations or work
   performed to clean up the data.
- tidy_data.txt: The
   output of the run_analysis.R script—a tidy dataset ready for further analysis.

### **How the script works**

1. The run_analysis.R script starts by checking if the dataset exists in the working
   directory. If not, it downloads and unzips the dataset.
2. It then reads the required dataset files into R.
3. After loading the datasets, it merges the training and testing
   datasets into one single dataset.
4. The script then extracts only the required measurements (mean and
   standard deviation for each measurement) from the merged dataset.
5. The activity labels are replaced with descriptive names.
6. The dataset variables are then renamed with descriptive labels,
   transforming abbreviated names into full descriptive names to improve
   clarity.
7. Finally, the script creates a tidy dataset containing the average of
   each variable for each activity and each subject. This new dataset is
   saved as tidy_data.txt.

### **Usage**

To execute the analysis, simply run the run_analysis.R script in R.

source('run_analysis.R')

This will produce the tidy_data.txt file in your working directory.

### **Dependencies**

run_analysis.R depends on the dplyr package, which can be installed using the
following R command:

install.packages("dplyr")

### **How to Get Started**

To run the analysis, clone this repository and execute
the run_analysis.R script in R.

### **Contact**

For any additional questions about this project,
please reach out through the issues on this GitHub repository.
