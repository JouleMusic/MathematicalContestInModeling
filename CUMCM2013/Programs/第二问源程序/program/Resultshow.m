%% ���������ݱ߽������������ƴ�Ӻõ�ͼ��
function Resultshow(A)
load data1         %%����ͼ������
%load data2         %%Ӣ��ͼ������
%% ��ű任��ͼ��ƴ��
x1=-A(:,1);
x2=A(:,2);
len=length(x1);
a=zeros(len,1);

a(1)=x2(1);
for i=2:len
    a(i)=x1(x2==a(i-1));
end
a=a-1;
a=[a;a(1)];
a(1)=[];
imgg=[img0 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18];
[~,n]=size(m1);
img=imgg;
a'
for i=1:length(a)
    img(:,(1+n*(i-1)):(n*(i-1)+n))=Imgcellmatrix{a(i)};
end
%% ͼ����ǿ����ʾ�ͱ���
figure;
img=imadjust(img);
imshow(img)
imwrite(img,'result.png');