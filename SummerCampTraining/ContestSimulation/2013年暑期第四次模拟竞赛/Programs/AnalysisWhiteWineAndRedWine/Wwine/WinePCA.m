%%%%%%%%% Principle Component Analysis Function By John Yang%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �������ݲ������ɷַ���
load WineW
[coef,score,latent,t2]=princomp(Y);
percent_explain=100*latent/sum(latent);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����������ͼ
figure('Color',[1 1 1])
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��һ�����ɷ�ɢ��ͼ 
figure('Color',[1 1 1]);
biplot(coef(:,1:2),'score',score(:,1:2),'varlabels',names);
grid on;
title('���ɷַ���ɢ��ͼ(1,2�����ɷ�)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ���������ɷ�ɢ��ͼ
figure('Color',[1 1 1]);
biplot(coef(:,3:4),'score',score(:,3:4),'varlabels',names);
grid on;
title('���ɷַ���ɢ��ͼ(3,4�����ɷ�)');
xlabel('component 3');
ylabel('component 4');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ���������ɷ�ɢ��ͼ
figure('Color',[1 1 1]);
biplot(coef(:,5:6),'score',score(:,5:6),'varlabels',names);
grid on;
title('���ɷַ���ɢ��ͼ(5,6�����ɷ�)');
xlabel('component 5');
ylabel('component 6');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ���߰����ɷ�ɢ��ͼ
figure('Color',[1 1 1]);
biplot(coef(:,7:8),'score',score(:,7:8),'varlabels',names);
grid on;
title('���ɷַ���ɢ��ͼ(7,8�����ɷ�)');
xlabel('component 7');
ylabel('component 8');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �ھ�ʮ���ɷ�ɢ��ͼ
figure('Color',[1 1 1]);
biplot(coef(:,9:10),'score',score(:,9:10),'varlabels',names);
grid on;
title('���ɷַ���ɢ��ͼ(9,10�����ɷ�)');
xlabel('component 9');
ylabel('component 10');
pause;
close all;
