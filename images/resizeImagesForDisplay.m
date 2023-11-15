images = dir('*.jpg');

for ii = 1: numel(images)
    filename = images(ii).name;
    img = imread(filename);
    % figure;imshow(img);
    img_resize = resizeAndCropToSquare(img);
    % figure;imshow(img_resize);
    imwrite(img_resize,filename)
end

function outputImage = resizeAndCropToSquare(inputImage)
    % Determine the size of the input image
    [rows, cols, ~] = size(inputImage);

    % Calculate the scaling factor
    scale = 640 / min(rows, cols);

    % Resize the image while maintaining aspect ratio
    resizedImage = imresize(inputImage, scale);

    % Get the size of the resized image
    [newRows, newCols, ~] = size(resizedImage);

    % Calculate cropping coordinates
    rowStart = round((newRows - 640) / 2) + 1;
    colStart = round((newCols - 640) / 2) + 1;

    % Crop the central 640x640 part of the image
    outputImage = imcrop(resizedImage, [colStart rowStart 639 639]);
end
