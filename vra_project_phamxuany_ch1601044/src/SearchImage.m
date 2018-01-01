function SearchImage(imagePath)
    %Load and show image query
    queryImage = imread(imagePath);
    figure(1)
    imshow(queryImage);
    
    load('index.mat');
    imageResults = retrieveImages(queryImage, imageIndex);
    fprintf('\n So ket qua: %d\n', size(imageResults,1));
    index = 0;
    imgResults = [];
    for(i = 1:size(imageResults,1))
        index = index + 1;
        imgResult = imread(imageIndex.ImageLocation{imageResults(i, 1)});
        thumbnail = imresize(imgResult,[300 300]);
        %Show multi image results in one figure
        imgResults = cat(4,imgResults,thumbnail);                
    end
    figure(2)
    montage(imgResults);
end