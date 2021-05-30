function result = mypredict

load('key2str_map.mat','-mat',"key2str_map")
load('height.mat','-mat',"height")
load('weight.mat','-mat',"weight")
load('latitude_num.mat','-mat',"latitude_num")
load('eigenfaces.mat','-mat',"eigenfaces")
load('kNNClassifier.mat','-mat',"kNNClassifier")

[test_data, ~] = read(height, weight, 1, 1,'predict/'); %read in predict samples

test_data = test_data - mean(test_data); %subtract the mean
test_data=normalize(test_data);

[~, n] = size(test_data); %get number of photos

Test = zeros(latitude_num, n); %create test sample matrix

Test= regress(test_data, eigenfaces);


y = predict(kNNClassifier, Test');

result = key2str_map(y);

end