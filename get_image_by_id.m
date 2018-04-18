% PCA - Principal Component Analysis
% Authors: Dariusz Dybka, Pawe³ Drapiewski
%% This are functions for handling images like getting image from set etc.

function image = get_image_by_id(image_id_number)
    % this function will return array values of image that resides under 
    % image_id_number in images array (which was read on startup)
    try
        images = evalin('base', 'images'); % read images from base workspace
        tmp = images(image_id_number, 2);
        image = tmp{1};
        % delete not necessary variables
        clear tmp
    catch
        error('You must read images first! Make sure that images cell array (called images) exist in your workspace')
    end
end
    