This codebook refers to the data set located in the file MeanUCIData.txt. The README file, which is also located in this repository shares the rationale for this project.
Description of Data:
  MeanUCIData.txt is a text file containing space separated values. The first row refers to the names of the variables, and the succeeding rows contain the values.
  
Variables:
  1. Subject - identifies the subject. (Integer values)
  2. Activities - the activities the subjects do (Character values)
     1. WALKING
     2. WALKING_UPSTAIRS
     3. WALKING_DOWNSTAIRS
     4. SITTING
     5. STANDING
     6. LAYING

Measurements:
timeDomain refers to the data captured by the accelerometer and gyroscope while frequencyDomain refers to the transformed value of the raw signals.

X, Y and Z refer to the direction in 3d space the data is captured in. The mean and standard deviation refer to the average of the captured data and standard deviation of the data set respectively.

Data Transformation:
The zip file containing the source data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data:

  - The training and test sets were merged to create one data set.
  - The measurements on the mean and standard deviation were calculated for each data set.
  - The activity identifiers were changed from integer values to the values in the Variable section.
  - The column names of the data set were also expanded:
    - Special characters (i.e. (), and -) were removed
    - The initial f and t were expanded to frequencyDomain and timeDomain 
    - Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Mean, and StandardDeviation respectively.
  - The Final data set was created with the average of each variable for each activity per subject (group by activity and subject)
  
