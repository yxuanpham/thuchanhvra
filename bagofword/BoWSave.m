function BoWSave()
    rootFolder = fullfile('DataTrain');
    categories = {'0', '1', '2', '3', '4' , '5', '6', '7', '8', '9'};
    imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
    tbl01 = countEachLabel(imds);
    minSetCount = min(tbl01{:,2});
    imds = splitEachLabel(imds, minSetCount, 'randomsize');
    tbl02 = countEachLabel(imds);
    bag = bagOfFeatures(imds);
end