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
    
    % calculate mean values of pixel in all images
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
    
    % calculate eigenface
    L = A' * A;
    [V, D] = eig(L); % V - eigenvector; D - eigenvalue
    
    % TODO - probably not necassary
    % Kaiser's rule - if corresponing eigen value of eigen vector is
    % greater than 1 than eigenvector is choosen to create eigen face
    L_eigen_vector = [];
    for k = 1 : size(V, 2)
        L_eigen_vector = [L_eigen_vector V(:, k)];
    end
        
    eigen_faces = A * L_eigen_vector;
    %get projection of image on eigenspace
    projectimg = [];
    for i = 1 : size(eigen_faces, 2)
        temp = eigen_faces' * A(:,i);
        training_images{i, 7} = temp; % TODO rebuild it
        projectimg = [projectimg temp];
    end
    
    % Now read test image
    [hig, len] = size(test_image);
    test_image_as_vect = reshape(test_image', hig * len, 1);
    test_img_normalized = double(test_image_as_vect) - mean_values;
    test_img_projection = eigen_faces' * test_img_normalized;
    
    % calculate the euqidlian distance
    euclide_dist = [];
    for i=1 : size(eigen_faces, 2)
        temp = (norm(test_img_projection-projectimg(:,i)))^2;
        euclide_dist = [euclide_dist temp];
    end
    [euclide_dist_min recognized_index] = min(euclide_dist);
    
    matched_image = training_images{recognized_index, 2};
    a = 1;
end