# CodeBook.md

## Project Title

Human Activity Recognition Using Smartphones Dataset Analysis

## Study Design and Data Processing

### Collection of the Raw Data

Data were collected from the accelerometers and gyroscopes of the Samsung Galaxy S smartphone worn by 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and the resulting data were split into training and test sets.

### Notes on the Original (Raw) Data

- The original dataset included various files for training and test data, subject identification, activity labels, and sensor measurements (561 features).
- Measurements were normalized and bounded within the range [-1,1].

### Processing of the Raw Data for Analysis

1. The training and test sets were merged to create one data set.
2. Only the measurements on the mean and standard deviation for each measurement were extracted.
3. Descriptive activity names were used to label the activities in the data set.
4. The data set was labeled with descriptive variable names.

## Description of the Tidy Data Set

The tidy data file `tidy_data.txt` is a space-delimited text file that contains a header with the names of the variables. The data follows the "tidy data" principles:

- Each variable forms a column and contains all values for that variable.
- Each observation forms a row.
- Each type of observational unit forms a table.

The resulting tidy data set includes the average of each variable for each activity and each subject.

## Variables Description

Each row in the tidy data set represents the average of each variable for each subject and each activity. The columns are as follows:

- `subject`: An identifier of the subject who carried out the experiment, ranging from 1 to 30.
- `activity`: The activity performed by the subject during measurements:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

Following the activities column, there are several columns corresponding to the average of various measurements (79 variables in total), including:

- Time-domain signals (prefix `Time`), indicating time-domain measurements.
- Frequency-domain signals (prefix `Frequency`), indicating Fast Fourier Transform (FFT) applied to some signals.
- Mean (`mean`) and Standard Deviation (`std`) measurements.
- Axes of measurement (`X`, `Y`, `Z`), indicating the direction of the measurement.

These are prefixed with either "Time" or "Frequency" to denote time-domain and frequency-domain measurements, respectively, and suffixed with either "mean" or "std" to denote the type of statistical summary used.

- `TimeBodyAccelerometer.mean...X`: The average body acceleration signal from the accelerometer in the X direction (mean value).
- `TimeBodyAccelerometer.mean...Y`: ... Y direction (mean value).
- `TimeBodyAccelerometer.std...Z`: ... Z direction (standard deviation value).
- ... (Other variables of similar format ending with `.mean..` or `.std..`)
- Angular acceleration measurements are labeled similarly, with `Gyroscope` instead of `Accelerometer`.

The "angle" variables represent angles between vectors:

- `angle.tBodyAccelerometerMean.gravity.`: Angle between tBodyAccelerometerMean and gravity.
- ... (Other angle variables in similar format)

The full list of variables includes all combinations of time and frequency domain accelerometer and gyroscope measurements, along with the magnitudes of these three-dimensional signals, for mean and standard deviation.

### Transformations

The raw data were processed using the following transformations:

1. Merged training and test datasets.
2. Extracted the mean and standard deviation for each measurement.
3. Renamed activities to be more descriptive.
4. Labeled the dataset with descriptive variable names according to the features described above.
5. Calculated the average of each variable for each activity and each subject to create the tidy data set.

---

This CodeBook provides a high-level overview of the clean dataset including descriptions of the study design, variables, and the transformations applied to clean up the data. If more specific details from the original dataset's `features_info.txt` are required, information such as the exact methods for normalization and bounding can be included for completeness.
