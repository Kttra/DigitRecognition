%Kttra

%% Close all figures and clear variables and console.
clc;
clear all;


%% Step 1, Part(a)
%Load the matrix file that contains 4 arrays
load USPS.mat;

%Rename the array train_patterns to training_digits
training_digits = train_patterns;

%Rename the array test_patterns to test_digits
test_digits = test_patterns;

%Rename the array train_labels to training_labels
training_labels = train_labels;


%% Step 1, Part(b)
%Reshapes the first 16 columns of training_digits and then displays the images
for k = 1:16
    subplot(4,4,k);
    imagesc(reshape(training_digits(:,k), [16,16])');
end


%% Step 2
%Create a new figure
figure(2);

%Calculates the mean digits of training_digits
for k = 1:10
    %Forms a matrix containing all the images in training_digits corresponding to digit k-1
    image = training_digits(:, training_labels(k,:)==1);
    
    %Sums the rows of image and divides by the number of col of the image
    training_averages(:,k) = sum(image,2)/size(image,2);
    
    %Plots the mean digit k-1
    subplot(2,5,k);
    imagesc(reshape(training_averages(:,k), [16,16])');
end


%% Step 3, Part(a)

%Calculate an array, test_classification, that contains the euclidean 
%distance between each image in the test_digits and each mean digit image in training_averages
for k = 1:10
    test_classification(:,k) = sum((test_digits-repmat(training_averages(:,k),[1 4649])).^2);
end


%% Step 3, Part(b)

%Computing the classification results
for j = 1:size(test_classification)
    %Calculates the minimum value of row j and the index
    [tmp, ind] = min(test_classification(j,:));
    
    %Assigns the index of the minimum value in the row j
    test_classification_res(1, j) = ind;
end


%% Step 3, Part(c)

%Computes the confusion matrix
for k = 1:10
    %Gathers the classification results that correspond to the k - 1 digit
    tmp = test_classification_res(test_labels(k,:)==1);
    
    %Counts how many times the value j appears in classification result of
    %the k - 1 digit
    for j = 1:10
        test_confusion(k,j) = sum(tmp(1,:) == j);
    end
end

%% Step 4, Part(a)

%Computes the rank 17 SVD of the set of images corresponding to the kth- 
%digit in training_digits
for k = 1:10
    [left_singular_vectors(:,:,k),~,~] = svds(training_digits(:,training_labels(k,:)==1),17);
end

%% Step 4, Part(b)

%Computes the expansion coefficients of each test digit image
for k = 1:10
    test_svd17(:,:,k) = left_singular_vectors(:,:,k)' * test_digits;
end


%% Step 4, Part(c)

%Calculates svd_classification
for k = 1:10
    for j = 1:4649
        
        %Computes the error between the original test digit image and its 
        %rank 17 approximation
        tmp  = norm(test_digits(:,j) - left_singular_vectors(:,:,k)*test_svd17(:,j,k));
        
        %Determines the minimum position of each of the columns
        test_digits_rank_17_approximation(k,j) = tmp;
        [tmp,ind] = min(test_digits_rank_17_approximation(:,j));
        
        %Sets the index position for the svd classification
        svd_classification(1,j) = ind;
    end
end


%% Step 4, Part(d)

%Computes the confusion matrix
for k = 1:10
    %Gathers the classification results that correspond to the k - 1 digit
    tmp = svd_classification(test_labels(k,:)==1);
    
    %Counts how many times the value j appears in classification result of
    %the k - 1 digit
    for j = 1:10
        test_svd17_confusion(k,j) = sum(tmp(1,:) == j);
    end
end

%Outputs the confusion matrices for the simple alg and svd alg
test_confusion
test_svd17_confusion

