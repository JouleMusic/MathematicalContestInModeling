load data1;
% shunxu=cell(11,23);
shunxu=cell(1,11);
rowcluster;

disp('���������1��ʾ���Խ��ܣ�0��ʾ������');
fff=input('');
while ~fff
    rowcluster;
    disp('���������1��ʾ���Խ��ܣ�0��ʾ������');
    fff=input('');
end
badsort=[];
for j=1:11
    [A,badsort{j}]=rowsort(index{j},0.72);
%     k=1;%k��ʾshunxuԪ���ڴ����ȷ���ݵ�λ��
    x1=-A(:,1);%��ȥ����������
    x2=A(:,2);
    x2(x1<0)=[];x1(x1<0)=[];
    x1(x2<0)=[];x2(x2<0)=[];
%     for i=1:length(x1)%����һ�����ȷ����
%       imshow([I{x2(i)},I{x1(i)}]);
%       disp('��ȷ��1��ȷ��0����ȷ');
%        f=input('');
%      if f
%         shunxu{j,k}=[x2(i),x1(i)];
%         k=k+1;
%      end
%     end
shunxu{j}=[x2,x1];
clear A x1 x2
end

close all
pinjie;
% ��ʾ
% for i=1:11
%     len=length(shunxu{i});
%     x=[];
%     for j=1:len
%         x=[x,I{shunxu{i}(j)}];
%     end
%     figure;
%     imshow(x);
% imwrite(x,[int2str(i),'.bmp']);%д���ļ�
% end
t=0;%ͳ�Ʋ���
for i=1:11
    t=t+length(shunxu{i});
end
    aaa=['�ɹ����ӵ�ͼƬ��:',int2str(t)];
    disp(aaa);
    aaa=['ʣ����Ƭ��:',int2str(209-t)];
    disp(aaa);
    
    
    
    
    
    
