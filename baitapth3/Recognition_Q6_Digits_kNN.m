function Recognition_Q6_Digits_kNN(n)
    imgTrainAll = loadMNISTImages('../lecture02/data/train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('../lecture02/data/train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    
    imgTestAll = loadMNISTImages('../lecture02/data/t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('../lecture02/data/t10k-labels.idx1-ubyte');
    
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    lblImageTest = lblTestAll(n);
    figure;
    
    img2D = reshape(imgTest, 28, 28);
    imshow(img2D);
    strLabelImage = ['Anh test thu ', num2str(n), ' co nhan la: ', num2str(lblTestAll(n))];
    strLabelImage = [strLabelImage, '. Nhan dang la: ', num2str(lblPredictTest)];
    if(lblPredictTest == lblImageTest)
        strLabelImage = [strLabelImage, '. Ket qua nhan dang DUNG.']
    else
        strLabelImage = [strLabelImage, '. Ket qua nhan dang SAI.']
    end
end