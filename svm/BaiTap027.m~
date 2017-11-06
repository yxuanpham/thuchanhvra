function BaiTap027()
    %% Load Image Data Train
    strDataTrain = '../data/train-images.idx3-ubyte';
    strDataLabelTrain = '../data/train-labels.idx1-ubyte';
    [imgTrainAll, lblTrainAll] = loadData(strDataTrain, strDataLabelTrain);
    nBins = 256;
    nTrainImages = size(imgTrainAll, 2);
    imgTrainAll_hist = zeros(nBins, nTrainImages);
    for i = 1:nTrainImages
        imgTrainAll_hist(:,i) = imhist(imgTrainAll(:,i),nBins);
    end
    Mdl = fitcecoc(imgTrainAll_hist',lblTrainAll);
    
    %% Load Image Data Test
    strDataTest = '../data/t10k-images.idx3-ubyte';
    strDataLabelTest = '../data/t10k-labels.idx1-ubyte';
    [imgTestAll, lblTestAll] = loadData(strDataTest, strDataLabelTest);
    
    nTestImages = size(imgTestAll, 2);
    imgTestAll_hist = zeros(nBins, nTestImages);
    for i = 1:nTestImages
        imgTestAll_hist(:,i) = imhist(imgTestAll(:,i),nBins);
    end
    lblResult = predict(Mdl, imgTestAll_hist');
    
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\n So luong mau dung: %d\n', nCount);
end
    