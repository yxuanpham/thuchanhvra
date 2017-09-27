function Recognition001_Digits()
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('../data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../data/train-labels.idx1-ubyte');
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('../data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../data/t10k-labels.idx1-ubyte');
    fprintf('\n Ket thuc. \n');
end