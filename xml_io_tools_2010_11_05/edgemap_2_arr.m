function [ arr ] = edgemap_2_arr( edgemap )
%UNTITLED3 此处显示有关此函数的摘要
%    
size = numel(edgemap);
arr = zeros(size,2);
for i=1:size
    arr(i,1) = edgemap(i).xCoord;
    arr(i,2) = edgemap(i).yCoord;
   
end

end

