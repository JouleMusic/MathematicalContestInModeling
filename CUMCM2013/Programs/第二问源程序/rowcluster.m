%%%%%%%%%%%%%%%%%%% �����������ĵ���д����ʶ����  %%%%%%%%%%%%%%%%%%%%%%%%
%% ��������
load data1 
hei=I;
m=I{209};
[hhh,lll]=size(m);
linshi=255*ones(1,lll);
mudi=zeros(1,lll);
for i=1:209
    j=1;
    while j<hhh+1
      if hei{i}(j,:)==linshi
          
      else
        hei{i}(j,:)=mudi;
      end
          j=j+1;
    end
end

bound=zeros(hhh,209);
for i=1:209
    bound(:,i)=hei{i}(:,1);
end
boundary=bound';
    
clear  i mudi linshi j hhh lll
%% ͼ��ƥ��
%%%%%%%%%%%%%%%%%%%%%%%% ����һ�������   %%%%%%%%%%%%%%%%%%%%%%%%
% s=char(1,209);
% for i=1:209
%     s(i)=' ';
% end
% figure('Color',[1 1 1])
% y=pdist(boundary,'seuclidean');             %����ŷʽ����
% z=linkage(y,'ward');                %���ƽ���ͷ�������
% [H,T]=dendrogram(z,209,'labels',s);  %���ƶ�̬������
% xlabel('�������');
% ylabel('����');
% title('��̬����ͼ');
% Clss=cluster(z,'maxclust',11);
% index=cell(1,11);
% for i=1:11
%     tm=find(Clss==i);   %���i��Ķ���
%     tm=reshape(tm,1,length(tm)); %���������
%     index{i}=tm;
% end
% clear PSF H T i s y z Clss  tm 

%%%%%%%%%%%%%%%%%%%%%   ������ fuzzy C-means�㷨   %%%%%%%%%%%%%%%%%%%%%%%%%%5%%
C_data=boundary;
%options=[2,1000,1e-10,1];    %%%%%%%%%%%%  ����ʶ��
options=[1.5,2000,1e-10,1];   %%%%%%%%%%%%  Ӣ��ʶ��
[center,U,obj_fcn]=fcm(C_data,11,options);
%%%%%%%%%% plot result and output result
%
maxU=max(U);
index=cell(1,11);
for i=1:11
    index{i}=find(U(i,:)==maxU);
end
%
for i=1:11
   fprintf('��%d�����%s\n',i,int2str(index{i}));
end
clear center U obj_fcn C_data maxU
%