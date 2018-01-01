function IndexDataset()
    strFileName = 'index.mat';
    rootFolder = fullfile('oxi_test');
    imds = imageDatastore(rootFolder);
    imageIndex = indexImages(imds);
    save(strFileName, 'imageIndex');
end