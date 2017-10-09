function BaiTap011()
    imgTrainAll =  loadMNISTImages('../lecture02/data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../lecture02/data/train-labels.idx1-ubyte');
    
    nBins = 256;
    nNumTrainImages = size(imgTrainAll,2);
    imgTrainAll_hist = zeros(nBins, nNumTrainImages);
    for i = 1:nNumTrainImages
        imgTrainAll_hist(:,i) = imhist(imgTrainAll(:,i),nBins);
    end
    Mdl = fitcknn(imgTrainAll_hist', lblTrainAll);
    
    imgTestAll = loadMNISTImages('../lecture02/data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../lecture02/data/t10k-labels.idx1-ubyte');
    
    nBins = 256;
    nNumTestImages = size(imgTestAll, 2);
    imgTestAll_hist = zeros(nBins, nNumTestImages);
    for i = 1:nNumTestImages
        imgTestAll_hist(:,i) = imhist(imgTestAll(:,i),nBins);
    end
    
    lblResult = predict(Mdl, imgTestAll_hist');
    nResult = (lblResult == lblTestAll);
    nCount = sum(nResult);
    fprintf('\n So luong mau dung: %d\n', nCount);
end
