function Recognition_Q7_Digits_kNN(n)
    imgTrainAll = loadMNISTImages('../lecture02/data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../lecture02/data/train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    
    imgTestAll = loadMNISTImages('../lecture02/data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../lecture02/data/t10k-labels.idx1-ubyte');
    
    countWrong = 0;
    countTrue = 0;
    
    nTestImgs = size(imgTestAll, 2);
    indices = find(lblTestAll==n);
    
    for idx = 1:numel(indices)
        %fprintf('Anh test %d thu: %d \n', n, idx);
        nNumber = indices(idx);
        lblImageTest = lblTestAll(nNumber);
        imgTest = imgTestAll(:, nNumber);
        lblPredictTest = predict(Mdl, imgTest');
        if(lblPredictTest == lblImageTest)
            countTrue = countTrue + 1;
        else
            countWrong = countWrong + 1;
            fprintf('Hinh thu %d. Wrong %d: \n', nNumber, countWrong);
        end
    end
    
    fprintf('\n So luong anh %d bi nhan dan sai: %d.\n',n,countWrong);
end