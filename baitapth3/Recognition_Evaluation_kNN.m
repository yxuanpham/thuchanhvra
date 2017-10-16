function Recognition_Evaluation_kNN(k)
    imgTrainAll = loadMNISTImages('../lecture02/data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../lecture02/data/train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll', lblTrainAll,'NumNeighbors',k,'Standardize',1);
    
    imgTestAll = loadMNISTImages('../lecture02/data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../lecture02/data/t10k-labels.idx1-ubyte');
    countTrue = 0;
    countFalse = 0;
    
    for n = 1:size(imgTestAll, 2)
        fprintf('%d\n', n);
        imgTest = imgTestAll(:, n);
        lblPredictTest = predict(Mdl, imgTest');
        lblImageTest = lblTestAll(n);

        if(lblPredictTest == lblImageTest)
            countTrue = countTrue + 1;
        else
            countFalse = countFalse + 1;
        end
    end
    fprintf('\nSo anh dung %d. So anh sai %d\n', countTrue, countFalse);
end