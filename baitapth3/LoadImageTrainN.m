function LoadImageTrainN(n)
    fprintf('\n Load du lieu train');
    imgTrainAll =  loadMNISTImages('../lecture02/data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../lecture02/data/train-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll, 2);
    
    figure;
    img = imgTrainAll(:, n);
    img2D = reshape(img, 28, 28); %reshape
    strLabelImage = num2str(lblTrainAll(n));
    imshow(img2D); %show image
    title(strLabelImage);
end