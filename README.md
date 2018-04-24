# image_proccesing_PCA
This code implements Principal Component Analysis (PCA) for Image Processing and Recognizing.

## Running the program

This program needs folder _Data_ (in project root) with your own face images. (It will be good if they had the same width and height)

## API reference

* To read images simply call ```read_images``` in your matlab main file, it will load test images into test_images and training images into training_images array.

* getting image by their position in images array:
    ```get_image_by_id(<image_position>, <cell array with images>)```
    or as alternative use cell array syntax: 
    ```<cell array with images>{1, 2}``` 