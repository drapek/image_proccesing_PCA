% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski

% This algoritm implements face recognition based on PCA method. 

test_images_dir = 'Data/emotions/test/';
test_images = load_images_into_array(test_images_dir);
training_images_dir = 'Data/emotions/training/';
training_images = load_images_into_array(training_images_dir);

% use mask on each photo
mask = im2double(imread('Data/emotions/face_mask.jpg'));

% put mask on read photos
for i = 1 : length(test_images) 
    image = test_images{i, 2};
    test_images{i, 2} = image .* mask;
end

for i = 1 : length(training_images) 
    image = training_images{i, 2};
    training_images{i, 2} = image .* mask;
end

% make loop for each test image
for i = 1 : size(test_images)
    fprintf('### Start procesing image %s \n', test_images{i, 1})
    test_image = get_image_by_id(i, 'test_images');
    result_image = match_image(test_image, training_images);
    % Show the results
    figure(i), imshow([test_image, result_image]), title('Test image / Matched image');
end