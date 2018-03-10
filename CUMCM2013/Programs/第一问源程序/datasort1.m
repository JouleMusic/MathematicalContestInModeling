%% ��������Ե�һ�ʺ��е��������ͼ����ಢ�Ҹ���ƴ�ӳ�����ͼ��
%% ���ݵ���
load data1;     %%����ͼ������
%load data2;    %%Ӣ��ͼ������
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

%% �������ݾ���
M=zeros(19*2,1980);
for i=1:2
    if i==1
       for j=1:19
             M(j,:)=(boundarycellmatrix{i,j})';
       end
    else
        for j=1:19
            M(j+19,:)=(boundarycellmatrix{i,j})';
        end
    end
end
clear i j ;
%% �������
figure('Color',[1 1 1])
s=cell(1,38);
for i=1:38
    if i<=19
      s{i}=num2str(-mod(i-1,19));
    else
        s{i}=num2str(mod(i-1,19));
    end
end
y=pdist(M,'euclidean');             %����ŷʽ����
z=linkage(y,'ward');                %���ƽ���ͷ�������
[H,T]=dendrogram(z,38,'labels',s);  %���ƶ�̬������
xlabel('�������');
ylabel('����');
title('��̬����ͼ');
Clss=cluster(z,'cutoff',0.1);
sortnumber=zeros(18,2);
for i=1:19
      tm=find(Clss==i);   %���i��Ķ���
   for j=1:2
      if tm(j)<=19
          tm(j)=-tm(j);
      else
          tm(j)=mod(tm(j),20)+1;
      end
   end
    tm=reshape(tm,1,length(tm)); %���������
    sortnumber(i,:)=tm;
end
clear H T M  PSF T i s y z Clss j  tm score;
%% ͼ��ƴ�Ӵ���
clear imgcellmatrix boundarycellmatrix
Resultshow(sortnumber);