function CreateDataTest()
    %% Load Image Data Test
    strData = '../data/t10k-images.idx3-ubyte';
    strDataLabel = '../data/t10k-labels.idx1-ubyte';
    [imgTestAll, lblTestAll] = loadData(strData, strDataLabel);
    
    nTestImages = size(imgTestAll, 2);
    %% Create Folders
    for i = 0:9
        mkdir(['DataTest/' num2str(i)]);
    end
    
    %%Extract Images to Folders
    index = zeros(1,10);
    for i = 1:nTestImages
        imgI = imgTestAll(:,i);
        img2D = reshape(imgI, 28, 28);
        category = lblTestAll(i);
        strFileName = ['image' num2str(index(1, category + 1), '%05d') '.jpg'];
        strPath = ['DataTest/' num2str(category) '/' strFileName];
        %%Save Images
        imwrite(img2D, strPath);
        index(1, category + 1) = index(1, category + 1) + 1;
    end
end