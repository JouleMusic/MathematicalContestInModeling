load data;
global shunxuu
I=Imagdata(1,:);
%I=Imagdata(2,:);
%%%%%%%%%%%�������������ó��򡡡���������������������������
%���ڵ���������˫��ƴ�ӣ���ǰ���㷨�����𣬹��ص�����㷨
shunxu=cell(1,11);
rowcluster;
disp('���������1��ʾ���Խ��ܣ�0��ʾ������');
fff=input('');
while ~fff
    rowcluster;
    disp('���������1��ʾ���Խ��ܣ�0��ʾ������');
    fff=input('');
end

for j=1:11
    A=rowsort(index{j},0.7);
%     k=1;%k��ʾshunxuԪ���ڴ����ȷ���ݵ�λ��
    x1=-A(:,1);%��ȥ����������
    x2=A(:,2);
    x2(x1<0)=[];x1(x1<0)=[];
    x1(x2<0)=[];x2(x2<0)=[];

shunxu{j}=[x2,x1];
clear A x1 x2
end
close all
pinjie;


%% ��ͼ
[hnhn,lnln]=size(shunxuu);
for k=1:hnhn
   
    
    AAA=[];f=1;
    while f
    %% ���
    for mmm=2:length(AAA)
        shunxuu{k,AAA(1)}=[shunxuu{k,AAA(1)},shunxuu{k,AAA(mmm)}];
        shunxuu{k,AAA(mmm)}=[];
    end
 %% ������ͼ
 
 close all
 for i=1:lnln
    if ~isempty(shunxuu{k,i})
    len=length(shunxuu{k,i});
    x=[];
    for j=1:len
        x=[x,I{shunxuu{k,i}(j)}];
    end
    figure(i);
    imshow(x);
    end
end
%% �ж�
disp('��Щͼ������һ����1�ܣ�0����');
f=input('');
if f
    disp('�Ծ�����ʽ����һ��˳��')
    AAA=input('');
end
end
end


%% ȥ��index�����ʹ�ù���ͼƬ
[hang,lie]=size(shunxuu);
for i=1:hang
    sx=[];
    for j=1:lie
    if ~isempty(shunxuu{i,j})
        sx=[sx,shunxuu{i,j}];
    end
    end
    len=length(sx);
    for k=1:len
        index{i}(index{i}==sx(k))=[];
    end
end
final=cell(1,1);
%% ȫ��������ֶ��Ĵ�

huatu






 
