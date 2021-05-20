key_map; %create map

height=130;
weight=110;
save height
save weight

[A, A_label] = read(height, weight, 1, 7,'crop/'); %read in photos

%Step 1: PCA

A2 = A - mean(A);
A2=normalize(A2);

train_label=A_label;
[d, U, Vs] = my_pca(A2);

%[Vs, X, d] = pca(A');

i = 0;
k = 0;

while k < 0.95*sum(d)
    i = i+1;
    k = k + d(i);
end
latitude_num = i;
save latitude_num


colormap(gray(256));          % Use a 256-value grayscale color map
daspect([1 1 1]);


Vs1 = Vs';
A3 = U(:, 1:i)*Vs1(1:i, :)+mean(A); %imgaes after compression

eigenfaces = U(:, 1:i);
train_data = normalize(Vs1(1:i, :));
save train_label
save train_data
save eigenfaces


