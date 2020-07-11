% % filename='����ɨˮ.jpeg';
% filename='����ɨˮƴ��.jpg';
% % filename='pic72.jpeg';
% I=imread(filename);
% J=undistortImage(I,cameraParams,'nearest');% 'linear', 'nearest' , or 'cubic'.
% subplot(1,2,1);
% imshow(I),title('ԭʼͼ��');
% subplot(1,2,2);
% imshow(J),title('���У���');
% imwrite(J,'����ɨˮƴ�ӽ����.jpeg','jpeg');

for i =1:1:26
% filename='����ɨˮ.jpeg';
filename=sprintf('pic%d.jpg',i);
filename
% filename='����ɨˮƴ��.jpeg';
% filename='pic72.jpeg';
I=imread(filename);
J=undistortImage(I,cameraParams,'nearest');% 'linear', 'nearest' , or 'cubic'.
% figure;
% subplot(1,2,1);
% imshow(I),title('ԭʼͼ��');
% subplot(1,2,2);
% imshow(J),title('���У���');
filename=sprintf('jh%d.jpg',i);
imwrite(J,filename,'jpg');
end