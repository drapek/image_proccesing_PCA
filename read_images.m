% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski
%% This file imports the jpg images from Data folder. Images will be saved
% in 'images' variable

dir_name = 'Data/';
images_folder = dir([dir_name, '*.jpg']);
images = [];

% For each image in 'dir_name' folder
for k=1:length(images_folder)
    file_name = images_folder(k).name;
    % read the image and convert it to double
    image = im2double(imread([dir_name, file_name]));
    % resize to 200x200
    image = imresize(image, [200, 200]);
    % change on gray scale
    image = rgb2gray(image);
    % save the images to repository array with the names
    images{k, 1} = file_name;
    images{k, 2} = image;
end

% clear the the unnecessary variables
clear dir_name file_name image images_folder k