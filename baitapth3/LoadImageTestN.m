function LoadImageTestN(n)
    fprintf('\n Load du lieu test');
    imgTestAll =  loadMNISTImages('../lecture02/data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../lecture02/data/t10k-labels.idx1-ubyte');
    
    nTestImages = size(imgTestAll, 2);
    
    figure;
    img = imgTestAll(:, n);
    img2D = reshape(img, 28, 28); %reshape
    strLabelImage = num2str(lblTestAll(n));
    imshow(img2D); %show image
    title(strLabelImage);
end