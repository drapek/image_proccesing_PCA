% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski
%% Main module for face recogition. It uses PCA to compare the images and find the match.

function matched_image = match_image(test_image, training_images)
    training_images_count = length(training_images);
    
    % change each image (array) on one-row vector
    for i = 1 : training_images_count
        [hig, len] = size(training_images{i, 2});
        image_as_vector = reshape(training_images{i, 2}', hig * len, 1);
        training_images{i, 3} = image_as_vector; % save it for debuging
    end
    
    % calculate mean values of pixel in for all images
    mean_values = [];
    for i = 1 : size(training_images{1, 3})
        sum = 0;
        for j = 1 : training_images_count
            image = training_images{j, 3};
            sum = sum + image(i);
        end
        mean_values = [mean_values; sum/training_images_count];
    end
    
    % count A mattrix (substract all pixels from the mean)
    A = [];
    for i = 1 : training_images_count
        substracted_image = double(training_images{i, 3}) - mean_values;
        A = [A substracted_image];
    end
    
    % calculate eigenfaces
    L = A' * A;
    [V, D] = eig(L); % V - eigenvector; D - eigenvalue
    eigen_faces = A * V;
    
    %count projection 
    projected_images = [];
    for i = 1 : size(eigen_faces, 2)
        projected_image = eigen_faces' * A(:,i);
        projected_images = [projected_images projected_image];
    end
    
    % Now read test image
    [hig, len] = size(test_image);
    test_image_as_vect = reshape(test_image', hig * len, 1);
    test_img_normalized = double(test_image_as_vect) - mean_values;
    test_img_projection = eigen_faces' * test_img_normalized;
    
    % calculate the euqidlian distance for each image.
    euklidean_distances = [];
    for i=1 : size(eigen_faces, 2)
        distance = (norm(test_img_projection-projected_images(:,i)))^2;
        euklidean_distances = [euklidean_distances distance];
    end
    % Image with the smallest equidlian distance will be the best match
    [best_euklidan_value index_value] = min(euklidean_distances);
    fprintf('Euklidan minimum value: %s\n', best_euklidan_value)
    matched_image = training_images{index_value, 2};
end