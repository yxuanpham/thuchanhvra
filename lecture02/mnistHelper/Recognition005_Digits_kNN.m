function Recognition005_Digits_kNN()
    imgTrainAll = loadMNISTImages('../data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../data/train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    
    imgTestAll = loadMNISTImages('../data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../data/t10k-labels.idx1-ubyte');
    
    nTestImgs = size(imgTestAll, 2);
    nNumber = randi([1 nTestImgs]);
    
    imgTest = imgTestAll(:, nNumber);
    lblPredictTest = predict(Mdl, imgTest');
    lblImageTest = lblTestAll(nNumber);
    figure;
    
    img2D = reshape(imgTest, 28, 28);
    imshow(img2D);
    strLabelImage = 'Ban dau ';
    strLabelImage = [strLabelImage, num2str(lblTestAll(nNumber)), '.'];
    strLabelImage = [strLabelImage, ' Du doan: '];
    strLabelImage = [strLabelImage, num2str(lblPredictTest), '.'];
    if(lblPredictTest == lblImageTest)
        strLabelImage = [strLabelImage, ' Ket qua dung.'];
    else
        strLabelImage = [strLabelImage, ' Ket qua sai. '];
    end
end