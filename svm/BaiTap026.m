function BaiTap026()
    %% Load Image Data Train
    strDataTrain = '../data/train-images.idx3-ubyte';
    strDataLabelTrain = '../data/train-labels.idx1-ubyte';
    %% Load Image Data Test
    strDataTest = '../data/t10k-images.idx3-ubyte';
    strDataLabelTest = '../data/t10k-labels.idx1-ubyte';
    
    [imgTrainAll, lblTrainAll] = loadData(strDataTrain, strDataLabelTrain);
    Mdl = fitcecoc(imgTrainAll', lblTrainAll);
    
    [imgTestAll, lblTestAll] = loadData(strDataTest, strDataLabelTest);
    lblResult = predict(Mdl, imgTestAll');
    
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\n So luong mau dung: %d\n', nCount);
end
    