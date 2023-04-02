function [wbc, rbc] = countcells(I)

I = imresize(I,[1368 1712]);

hsv=rgb2hsv(I);
s=hsv(:,:,2);

[m, ~]=kmeans(s(:),3);
m=reshape(m,size(s,1),size(s,2));
B1=labeloverlay(s,m);


hsv=rgb2hsv(B1);
h=hsv(:,:,1);
s=hsv(:,:,2);
v=hsv(:,:,3);

I32 = imbinarize(v-s);

B32 = bwareaopen(I32,200);

[B,~] = bwboundaries(B32,'noholes');

wbc = length(B);

%% RBC==============
b1 = imbinarize(I(:,:,3));
b1 = 1-b1;

b2 = bwareaopen(b1,100);

b3 = imfill(b2,'holes');

se = strel('disk',5,4);
b4 = imdilate(b3,se);
b4 = imfill(b4,'holes');

[ct,rd] = imfindcircles(b4,[30 80],'ObjectPolarity','bright','Sensitivity',0.95);

rbc = length(rd) - wbc;