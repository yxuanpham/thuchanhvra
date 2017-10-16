function [imgData, lblData] = loadData(strFileNameData, strFileNameLabel)
    addpath('../mnistHelper/');    
    imgData = loadMNISTImages(strFileNameData);
    lblData = loadMNISTLabels(strFileNameLabel);
end

