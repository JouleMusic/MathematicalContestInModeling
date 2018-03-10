%% ͼ��߽�Ҷ�ֵ�Ƚ�
%% ��ͼ��ı߽絥����ȡ��������
load data1;
boundarycellmatrix=cell(2,19);
imgcellmatrix=cell(1,19);
%% ͼ����Ԫ������
imgcellmatrix{1}=img0;
imgcellmatrix{2}=img1;
imgcellmatrix{3}=img2;
imgcellmatrix{4}=img3;
imgcellmatrix{5}=img4;
imgcellmatrix{6}=img5;
imgcellmatrix{7}=img6;
imgcellmatrix{8}=img7;
imgcellmatrix{9}=img8;
imgcellmatrix{10}=img9;
imgcellmatrix{11}=img10;
imgcellmatrix{12}=img11;
imgcellmatrix{13}=img12;
imgcellmatrix{14}=img13;
imgcellmatrix{15}=img14;
imgcellmatrix{16}=img15;
imgcellmatrix{17}=img16;
imgcellmatrix{18}=img17;
imgcellmatrix{19}=img18;
%% ����м����
clear img0 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11...
    img12 img13 img14 img15 img16 img17 img18;
%% ͼ��Ԫ������ת��
Imgcelldata=imgcellmatrix;
for j=1:19
         Imgcelldata{j}=double(Imgcelldata{j});
         Imgcelldata{j}=255-Imgcelldata{j};
end
%% ͼ��Ԥ����
%��ֵ�˲�����
for j=1:19
    I=Imgcelldata{j};
    PSF=fspecial('average',3);
    L=imfilter(I,PSF);
    Imgcelldata{j}=L;
end
clear I M N u v U V D H J K L;
%% ͼ��ı߽����Ҹ�һ���߽�
for i=1:2
    for j=1:19
        if i==1
            boundarycellmatrix{i,j}=Imgcelldata{j}(:,1);
        end
        if i==2
            boundarycellmatrix{i,j}=Imgcelldata{j}(:,72);
        end
    end
end
%% ��ͼ�Ƚ�
 x=Imgcelldata{1}(100:250,72);
 y=Imgcelldata{7}(100:250,1);
figure('Color',[1 1 1]);
plot(100:250,x,'r-','linewidth',2)
hold on;
plot(100:250,y,'b--','linewidth',2);
axis([100 260 0 180]);
title('000��ͼƬ��006��ͼƬ�߽����رȽ�ͼ')
legend('000��ͼƬ','006��ͼƬ');
hold off;
