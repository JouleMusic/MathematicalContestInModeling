%%%%%%%%%%%%%%%%% Box Plot Function By John Yang%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% load data
load WineR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box1
figure('Color',[1 1 1]);
boxplot(Y(1:27,1:16),'Orientation','horizontal','labels',names(1:16));
title('����ͼ��1-16�ű�����')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box2
figure('Color',[1 1 1]);
boxplot(Y(1:27,16:32),'Orientation','horizontal','labels',names(16:32));
title('����ͼ��16-32�ű�����')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box3
figure('Color',[1 1 1]);
boxplot(Y(1:27,32:48),'Orientation','horizontal','labels',names(32:48));
title('����ͼ��32-48�ű�����')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot box4
figure('Color',[1 1 1]);
boxplot(Y(1:27,48:64),'Orientation','horizontal','labels',names(48:64));
title('����ͼ��48-64�ű�����')