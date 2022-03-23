# DigitRecognition
MATLAB code to perform the handwritten digit recognition computations. This program is a comparision between the simple classification algorithm and the SVD Classification Algorithm. Below is the results of the tests.

**First 16 Images in Training Digits**
---------------------
The data structures where images of the digits are stored in are in structures known as
vectors or matrices. They both contain numeric entries and can be 2-dimensional. The training
data is a collection of images that we use to fit our model. In otherwords it is used to fit and
compare with another set. The test data is used to determine the performance of the model. In
addition, test data is unknown while the training data is known

![figure1](https://user-images.githubusercontent.com/100814612/159613923-898ab043-676e-4264-9a4c-a571dfe2cfcc.png)

**10 Mean Digit Images**
------------------------
In step 2, a new figure is created. The mean digits of training digits is calculated. This
is done by first creating a matrix that contains all the images in training digits that correspond
to the digits 0, 1, ..., 9. Then the sum of the rows are calculated and divided by the size of the
matrix or pool. In the end, we get the mean digits. We are calculating the average of each digit
class.

![figure2](https://user-images.githubusercontent.com/100814612/159613973-a0602cd8-6f85-4db2-9d00-e382a75389fc.png)

**Simple Classification Algorithm**
-------------------------
The test confusion matrix ends up not being as accurate compared to the SVD algorithm. The theory behind the algorithm is that we compute the distance to known digits and compare.
The Euclidean distance is the most commonly used one. In the end, we have the digit 2 being
the most easily identified compared to the other digits. The digit 8 is the hardest to identify.
Since the simple classification algorithm computes the distance from each unknown digit to the means, it would make sense that the 2 digit is the most accurate and the digit 8 is least accurate.
The 8 digit seems to have been mistaken as a 2, 5, and 0 quite often whereas the 2 digit was
only classified wrong in only a handful of cases. Overall, the simple classification algorithm
has a classification rate about 84.66%.
![table 1](https://user-images.githubusercontent.com/100814612/159615145-c48dfbc0-d41c-483c-a7c0-9e438588813b.png)

**SVD Classification Algorithm**
-------------------------
The SVD17 confusion matrix is more accurate at identifying the digits than the
simple classification algorithm. Similar to above, we have the digit 2 being the most easily identified. However, the digit 1 is
the hardest to identify in the SVD algorithm. It seems this is the case because the digit 1 is
often being mistaken for a 1. On the other hand, the 1 digit seems to be very accurate and was
only mistaken once as the digit 4, 8, and 9. The SVD classification algorithm had a overall
classification rate of about 96.62% which is significantly larger than the simple classification
algorithm.

The theory that is behind the SVD classification algorithm is that we are forming the disparity
in each of the digits by using orthogonal basis vectors. It is based off of the least squares
algorithm. The start of the algorithm begins with pooling the training digits. Then we compute
the SVD for each digit class. Followed by computing the error between each original test digit
image and its approximation. And finally seeing the results by computing the confusion matrix.


| Digit  | Accuracy |
| ------------- | ------------- |
| 0  | 97.97%  |
| 1  | 94.58%  |
| 2  | identified  |
| 3  | identified  |
| 4  | identified  |
| 5  | identified  |
| 6  | identified  |
| 7  | identified  |
| 8  | identified  |
| 9  | identified  |

**Summary**
-------------------------
The first figure displays the first 16 images from the array training digits. The second
figure displays the 10 mean digit images in training digits. The resulting test confusion matrix
illustrates that the simple classification algorithm does not perform as well as the SVD classification algorithm. In both algorithms, they identified the digit 2 the most correctly. In the simple
classification algorithm, the digit 8 was the most inaccurate one. On the other hand, the digit
1 was the least accuarate in the SVD classification algorithm.

Overall, the SVD classification
algorithm showed to be a lot more reliable with a classification rate of over 95% for each digit.
Whereas the simple classification algorithm had a classification rate ranging from about 74%
to 91% for each digit. Overall, the simple classification algorithm had a classification rate of
84.66% while the SVD classification algorithm had a classification rate of 96.62%. The reason
the SVD classification algorithm had better results is because the simple classification algorithm
does not take into account the variation within each digit class.
