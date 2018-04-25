

function loaded_images = load_images_into_array(dir_path)
    loaded_images = [];
    images_folder = dir([dir_path, '*.jpg']); % TODO get .jpg or .png
    % For each image in 'dir_name' folder
    for k=1:length(images_folder)
        file_name = images_folder(k).name;
        % read the image and convert it to double
        image = im2double(imread([dir_path, file_name]));
        % resize to 200x200
        image = imresize(image, [200, 200]);
        % change on gray scale
        image = rgb2gray(image);
        image = histeq(image);
        % save the images to repository array with the names
        loaded_images{k, 1} = file_name;
        loaded_images{k, 2} = image;
    end
end