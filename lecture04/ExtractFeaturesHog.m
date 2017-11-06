function [featuresData] = ExtractFeaturesHog(imgData)
    imgI1D = imgData(:, 1);
    imgI2D = reshape(imgI1D, 28, 28);
    [featureVector, hogVisualization] = extractHOGFeatures(imgI2D, 'CellSize', [2 2]);
    nSize = length(featureVector);
    nTrainData = size(imgData,2);
    featuresData = zeros(nSize, nTrainData);
    
    for i = 1:nTrainData
        imgI1D = imgData(:,i);
        imgI2D = reshape(imgI1D, 28, 28);
        featuresData(:, i) = extractHOGFeatures(imgI2D, 'CellSize', [2 2]);
    end
end