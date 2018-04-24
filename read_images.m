% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski
%% This file imports the jpg images from Data folder. Images will be saved
% in 'images' variable

% read traininig images
training_dir = 'Data/only_faces/training/';
training_images = load_images_to_array(training_dir);

% read test images
test_dir = 'Data/only_faces/test/';
test_images = load_images_to_array(test_dir);

% clear the the unnecessary variables
clear training_dir_name file_name image images_folder k

function loaded_images = load_images_to_array(dir_path)
    loaded_images = [];
    images_folder = dir([dir_path, '*.jpg']);
    % For each image in 'dir_name' folder
    for k=1:length(images_folder)
        file_name = images_folder(k).name;
        % read the image and convert it to double
        image = im2double(imread([dir_path, file_name]));
        % resize to 200x200
        image = imresize(image, [200, 200]);
        % change on gray scale
        image = rgb2gray(image);
        % save the images to repository array with the names
        loaded_images{k, 1} = file_name;
        loaded_images{k, 2} = image;
    end
end

