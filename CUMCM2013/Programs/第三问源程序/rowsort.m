%%%%%%%%%%%%%%%%%%%%    �������еľ�����ƴ��ͼ��   %%%%%%%%%%%%%%%%%%%%%%%
function [output,badsort]=rowsort(colnumvector,cutoff)
%% ���ݵ���
load data ;
I=[Imagdata(1,:),Imagdata(2,:)];
%I=Imagdata(2,:);
len=length(I);
len1=length(colnumvector);
boundarycellmatrix=cell(2,len1);
%% ͼ������ת��
for j=1:len
         I{j}=double(I{j});
         I{j}=255-I{j};
end
%% ѡ�������м�౻��Ϊһ���ͼ
Img=cell(1,len1);
for j=1:len1
      Img(j)=I(colnumvector(j));
end
%% ͼ��ı߽����Ҹ�һ���߽�
for i=1:2
    for j=1:len1
        if i==1
            boundarycellmatrix{i,j}=Img{j}(:,1);
        end
        if i==2
            boundarycellmatrix{i,j}=Img{j}(:,72);
        end
    end
end
%% �������ݾ���
M=zeros(2*len1,length(Img{1}(:,1)));
for i=1:2
    if i==1
       for j=1:len1
             M(j,:)=(boundarycellmatrix{i,j})';
       end
    else
        for j=1:len1
            M(j+len1,:)=(boundarycellmatrix{i,j})';
        end
    end
end
clear i j ;
%% �������
%figure('Color',[1 1 1]);
s=cell(1,2*len1);
for i=1:2*len1
    if i<=len1
      s{i}=num2str(-colnumvector(i));
    else
       s{i}=num2str(colnumvector(mod(i,len1+1)+1));
    end
end
y=pdist(M,'euclidean');             %����ŷʽ����
z=linkage(y,'ward');                %���ƽ���ͷ�������
%[H,T]=dendrogram(z,len1,'labels',s);  %���ƶ�̬������
%xlabel('�������');
%ylabel('����');
%title('��̬����ͼ');
%Clss=cluster(z,'cutoff',0.7125);
Clss=cluster(z,'cutoff',cutoff);
sortnumber=cell(1,1);
tmm=cell(1,1);
for i=1:max(Clss)
      tm=find(Clss==i);   %���i��Ķ���
      tmm{1}=tm';
   for j=1:length(tm)
      if tm(j)<=len1
          tmm{1}(j)=-colnumvector(tm(j));
      else
          tmm{1}(j)=colnumvector(mod(tm(j),len1+1)+1);
      end
   end
  sortnumber=[sortnumber,tmm];
end
clear H T i s y z Clss j  tm tmm;
%% ���
sortnumber=sortnumber(2:length(sortnumber));
badsort=[];
k=0;
for j=1:length(sortnumber)
    if length(sortnumber{j})==2
            k=k+1;
    end
end
output=zeros(k,2);
ii=1;
jj=1;
for j=1:length(sortnumber)
    if length(sortnumber{j})==2
            output(ii,:)=sortnumber{j};
            ii=ii+1;
    else
    %   fprintf('��������\n');
        sortnumber{j};
        badsort{jj}=sortnumber{j};
        jj=jj+1;
    end
end
%Resultshow(output)    
