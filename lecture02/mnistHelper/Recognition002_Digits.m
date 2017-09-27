function Recognition002_Digits()
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('../data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../data/train-labels.idx1-ubyte');
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('../data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../data/t10k-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll, 2);
    nTrainLabels = size(lblTrainAll, 1);
    
    nTestImages = size(imgTestAll, 2);
    nTestLabels = size(lblTestAll, 1);
    
    nSizeofImage = size(imgTrainAll, 1);
    
    fprintf('\n So luong anh train: [%d]. ', nTrainImages);
    fprintf('\n So luong nhan anh train: [%d]. ', nTrainLabels);
    fprintf('\n So luong anh test: [%d]. ', nTestImages);
    fprintf('\n So luong nhan anh test: [%d]. ', nTestLabels);
end