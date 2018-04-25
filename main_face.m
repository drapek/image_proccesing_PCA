% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski

% This algoritm implements face recognition based on PCA method. 

%% Main file - start point for the algorithm
close all, clear all;

% read images for processing
read_images

imwrite(test_images{1, 2}, 'face_mask.jpg')

% make loop for each test image
for i = 1 : size(test_images)
    fprintf('### Start procesing image %s \n', test_images{i, 1})
    test_image = get_image_by_id(i, 'test_images');
    result_image = match_image(test_image, training_images);
    % Show the results
    figure(i), imshow([test_image, result_image]), title('Test image / Matched image');
end

