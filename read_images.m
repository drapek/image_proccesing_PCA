% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski
%% This file imports the jpg images from Data folder. Images will be saved
% in 'images' variable

% read traininig images
training_dir = 'Data/only_faces/training/';
training_images = load_images_into_array(training_dir);

% read test images
test_dir = 'Data/only_faces/test/';
test_images = load_images_into_array(test_dir);

% read_outter images - for internal tests only
outter_dir = 'Data/outter_photos/';
outter_images = load_images_into_array(outter_dir);

% clear the the unnecessary variables
clear training_dir_name file_name image images_folder k


