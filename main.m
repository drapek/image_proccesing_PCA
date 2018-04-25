% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski

% This algoritm implements face recognition based on PCA method. 

%% Main file - start point for the algorithm
close all, clear all;

% read images for processing
read_images

% make loop for each test image
for i = 1 : size(test_images)
    test_image = get_image_by_id(i, 'test_images');
    result_image = match_image(test_image, training_images);
    % Show the results
    figure(i), imshow([test_image, result_image]), title('Test image / Matched image');
end

