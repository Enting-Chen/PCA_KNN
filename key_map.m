function key_map()
%create maps between names and key values
D = dir('crop/');
i = 1;
str2key_map=containers.Map();
key2str_map=containers.Map({0},{''});
for k = 3:length(D) 
    currD = D(k).name;
    str2key_map(currD)=i;
    key2str_map(i)=currD;
    i=i+1;
end
save str2key_map;
save key2str_map;

end