function BaiTap014()
    strData = '../data/train-images.idx3-ubyte';
    strDataLabel = '../data/train-labels.idx1-ubyte';
    [imgDataTrain, lblDataTrain] = loadData(strData, strDataLabel);
    
    imgI1D = imgDataTrain(:, 1);
    imgI2D = reshape(imgI1D, 28, 28);
    
    featuresVector = extractHOGFeatures(imgI2D);
    
    nSize = length(featuresVector);
    nTrainData = size(imgDataTrain, 2);
    
    %
    [featuresVector, visualHog] = extractHOGFeatures(imgI2D, 'CellSize', [8 8]);
    subplot(2,5,4);
    plot(visualHog);
    %
    
    featuresDataTrain = zeros(nSize, nTrainData);
    for i = 1:nTrainData
        imgI1D = imgDataTrain(:, i);
        imgI2D = reshape(imgI1D, 28, 28);
        featuresDataTrain(:,i) = extractHOGFeatures(imgI2D);
    end
    
    Mdl = fitcknn(featuresDataTrain', lblDataTrain);
    
    strDataTest = '../data/t10k-images.idx3-ubyte';
    strDataLabelTest = '../data/t10k-labels.idx1-ubyte';
    [imgDataTest, lblDataTest] = loadData(strDataTest, strDataLabelTest);
    
    imgI1D = imgDataTest(:,1);
    imgI2D = reshape(imgI1D, 28,28);
    featuresVector = extractHOGFeatures(imgI2D);
    nSize = length(featuresVector);
    nTestData = size(imgDataTest, 2);
    featuresDataTest = zeros(nSize, nTestData);
    
    for i = 1:nTestData
        imgI1D = imgDataTest(:,i);
        imgI2D = reshape(imgI1D, 28, 28);
        featuresDataTest(:,i) = extractHOGFeatures(imgI2D);
    end
    
    lblResult = predict(Mdl, featuresDataTest');
    nResult = (lblResult == lblDataTest);
    nCount = sum(nResult);
    fprintf('\nSo luong mau dung: %d\n', nCount);
end

