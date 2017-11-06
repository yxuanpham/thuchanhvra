function BaiTap028()
    %% Load Image Data Train
    strDataTrain = '../data/train-images.idx3-ubyte';
    strDataLabelTrain = '../data/train-labels.idx1-ubyte';
    [imgTrainAll, lblTrainAll] = loadData(strDataTrain, strDataLabelTrain);
    nBins = 144;    
    nTrainImages = size(imgTrainAll, 2);
    imgTrainAll_hog = zeros(nBins, nTrainImages);
    for i = 1:nTrainImages
        imgI = imgTrainAll(:,i);
        img2D = reshape(imgI, 28, 28);
        [featureVector, hogVisualization] = extractHOGFeatures(img2D);
        imgTrainAll_hog(:,i) = featureVector;
    end
    Mdl = fitcecoc(imgTrainAll_hog',lblTrainAll);
    
    %% Load Image Data Test
    strDataTest = '../data/t10k-images.idx3-ubyte';
    strDataLabelTest = '../data/t10k-labels.idx1-ubyte';
    [imgTestAll, lblTestAll] = loadData(strDataTest, strDataLabelTest);
    
    nTestImages = size(imgTestAll, 2);
    imgTestAll_hog = zeros(nBins, nTestImages);
    for i = 1:nTestImages
        imgI = imgTestAll(:,i);
        img2D = reshape(imgI, 28, 28);
        imgTestAll_hog(:,i) = extractHOGFeatures(img2D);
    end
    
    lblResult = predict(Mdl, imgTestAll_hog');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\n So luong mau dung: %d\n', nCount);
end
    