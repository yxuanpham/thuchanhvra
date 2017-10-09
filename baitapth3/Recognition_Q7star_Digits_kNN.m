function Recognition_Q7star_Digits_kNN()
    imgTrainAll = loadMNISTImages('../lecture02/data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../lecture02/data/train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    
    imgTestAll = loadMNISTImages('../lecture02/data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../lecture02/data/t10k-labels.idx1-ubyte');
    
    c = zeros(10, 10);
    u = unique(lblTestAll);
    nTestImgs = size(imgTestAll, 2);
    
    for val = 1:numel(u)
        n = u(val);
        fprintf('Anh so %d\n', n);
        indices = find(lblTestAll==n);
        for idx = 1:numel(indices)
            nNumber = indices(idx);
            lblImageTest = lblTestAll(nNumber);
            imgTest = imgTestAll(:, nNumber);
            lblPredictTest = predict(Mdl, imgTest');
            c(n+1,lblPredictTest+1) = c(n+1,lblPredictTest+1) + 1;
        end
    end
    csvwrite('confusion_matrix.csv', c);
end