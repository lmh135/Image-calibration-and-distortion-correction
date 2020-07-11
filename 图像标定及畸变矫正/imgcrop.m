clc;
clear all;
close all;

dList=dir('*.jpg'); 
len = length(dList);

for seq=1:len
    img = imread(['pic',int2str(seq),'.jpg']);
%     img = imread(['C:\Users\��\Desktop\pic_test\',dList(seq).name]);
%     figure;
%     imshow(img);

    img2=imcrop(img,[161,91,959,539]);
%     figure;
%     imshow(img2);
    imwrite(img2,['pic',int2str(seq),'.jpg']);
end