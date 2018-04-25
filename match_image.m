% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski
%% Main module for face recogition. It uses PCA to compare the images and find the match.

function matched_image = match_image(test_image, training_images)
    training_images_count = length(training_images);
    
    for i = 1 : training_images_count
        % save the result vector as third column
        image = training_images{i, 2};
        
        % Step 1 - change each image (array) on one-row vector
        [hig, len] = size(image);
        image_as_vector = reshape(image', hig * len, 1);
        training_images{i, 3} = image_as_vector; % save it for debuging
        
        % Step 2 - calculate necessary variables to count eigen values
        % avaerage face image of all training images
        image_mean_value_of_pixels = mean(training_images{i, 3});
        training_images{i, 4} = image_mean_value_of_pixels;
        % count A mattrix (substract all pixels from the mean)
        A = double(image_as_vector) - image_mean_value_of_pixels;
        
        % Step 3 - calculate eigenface
        L = A' * A;
        [V, D] = eig(L); % V - eigenvector; D - eigenvalue
        
        % Kaiser's rule - if corresponing eigen value of eigen vector is
        % greater than 1 than eigenvector is choosen to create eigen face
        for k = 1 : size(V)
            if (D(k) > 1)
                L_eigen_vector = V(k);
            end
        end
        
        eigen_face = A * L_eigen_vector;
        training_images{i, 5} = eigen_face;
        
        % Step 4 - get projection of image on facespace
        projecetion_image = eigen_face' * A;
        training_images{i, 6} = projecetion_image;
    end
    
    % TODO Read the test image
    
    
   
    
    % for now mock the matched_image
    matched_image = training_images{1, 2};
end