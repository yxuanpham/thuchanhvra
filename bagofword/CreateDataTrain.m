function CreateDataTrain()
    %% Load Image Data Train
    strData = '../data/train-images.idx3-ubyte';
    strDataLabel = '../data/train-labels.idx1-ubyte';
    [imgTrainAll, lblTrainAll] = loadData(strData, strDataLabel);
    
    nTrainImages = size(imgTrainAll, 2);
    %% Create Folders
    for i = 0:9
        mkdir(['DataTrain/' num2str(i)]);
    end
    
    %%Extract Images to Folders
    index = zeros(1,10);
    for i = 1:nTrainImages
        imgI = imgTrainAll(:,i);
        img2D = reshape(imgI, 28, 28);
        category = lblTrainAll(i);
        strFileName = ['image' num2str(index(1, category + 1), '%05d') '.jpg'];
        strPath = ['DataTrain/' num2str(category) '/' strFileName];
        %%Save Images
        imwrite(img2D, strPath);
        index(1, category + 1) = index(1, category + 1) + 1;
    end
end