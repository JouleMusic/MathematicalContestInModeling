%%%%%%%%%%%%%%%%%%%%%%  System Cluster Function %%%%%%%%%%%%%%%%%%%%%%%%%
%%>>>>>>>>>>>>>>>>>>   By John Yang        <<<<<<<<<<<<<<<<<<<<<<%%
%% Import Data
load WineW
%% PCA analysis
[coef,score,latent,t2]=princomp(Y);
percent_explain=100*latent/sum(latent);
figure('Color',[1 1 1]);
% pareto(percent_explain);
x=1:16;
kk(1)=percent_explain(1);
for index=2:16    
    kk(index)=kk(index-1)+percent_explain(index);
end
bar(percent_explain(1:16));
hold on
plot(x,kk,'linewidth',2);
hold off;
grid on;
title('���ɷֵ�������ͼ');
set(gca,'ytick',0:5:100);
set(gca,'xtick',0:1:16);
xlabel('���ɷ�');
ylabel('�ۻ�������(%)');
axis([0.6 16.4 0 100]);
%% Varibles Input
Counter=input('�����뱣�����ɷֵ���Ŀ:\n');
%% System Cluster
S_data=score(:,1:Counter);
distance=pdist(S_data,'euclidean'); %���S_data����������֮���mahalanobis����
distance=squareform(distance); %����������ת���ɾ��뷽��
z=linkage(distance,'ward');   %�����ȼ�������
figure('Color',[1 1 1])
[h,t]=dendrogram(z);   %����̬����ͼ
xlabel('�������');
ylabel('����');
title('��̬����ͼ');
T=cluster(z,'maxclust',4);

for i=1:4
    tm=find(T==i);   %��dii��Ķ���
    tm=reshape(tm,1,length(tm)); %���������
    fprintf('��%d�����%s\n',i,int2str(tm));  %display cluster result
end
pause;
close all;
