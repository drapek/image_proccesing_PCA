% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski

% This algoritm implements face recognition based on PCA method. 

%% Main file - start point for the algorithm
close all, clear all;

% read images for processing
read_images

% make loop for each test image
test_image = get_image_by_id(1, 'test_images');
result_image = find_match_image(test_image, training_images);
% Show the results
figure(1), imshow([test_image, result_image]), title('Test image / Matched image');
