function correct_rate = test

load('train_data.mat','-mat',"train_data")
load('train_label.mat','-mat',"train_label")
load('eigenfaces.mat','-mat',"eigenfaces")
load('latitude_num.mat','-mat',"latitude_num")
load('height.mat','-mat',"height")
load('weight.mat','-mat',"weight")

[test_data, test_label] = read(height, weight, 8, 10,'crop/'); %read in test samples


test_data = test_data - mean(test_data); %subtract the mean
test_data=normalize(test_data);

[~, n] = size(test_data); %get number of photos

Test = zeros(latitude_num, n); %create test sample matrix

for j = 1:n
    Test(:, j) = regress(test_data(:, j), eigenfaces);
end

%[~,N_test] = size(Y_test);
%for i=1:N_test
%[d, U, Vs] = my_pca(A2);

%YV=knn((X_test.'*K_matrix).',(X_train.'*K_matrix).', Y_train,5);
%[~,N_test] = size(Y_train);
y = knn(normalize(Test), train_data, train_label, 9);

correct_rate = length(find(y==test_label'))/n;
end




