%% ��������ʵ�ֶ�ʱ�����еĶ�߶ȷ���

%��mat�ļ��ж�������
load flow_time_series
%����MATLAB������ֽ��źŶԲݽ�һ�������ʱ�����н���С������
%% С����һά�ֽ�
[c,l]=wavedec(full_time_series_caojie,10,'bior6.8');
%% �ع���1~10��ƽ��ź�
a10=wrcoef('a',c,l,'bior6.8',10);
a9=wrcoef('a',c,l,'bior6.8',9);
a8=wrcoef('a',c,l,'bior6.8',8);
a7=wrcoef('a',c,l,'bior6.8',7);
a6=wrcoef('a',c,l,'bior6.8',6);
a5=wrcoef('a',c,l,'bior6.8',5);
a4=wrcoef('a',c,l,'bior6.8',4);
a3=wrcoef('a',c,l,'bior6.8',3);
a2=wrcoef('a',c,l,'bior6.8',2);
a1=wrcoef('a',c,l,'bior6.8',1);
%% �ع���1~10��ϸ���ź�
d10=wrcoef('d',c,l,'bior6.8',10);
d9=wrcoef('d',c,l,'bior6.8',9);
d8=wrcoef('d',c,l,'bior6.8',8);
d7=wrcoef('d',c,l,'bior6.8',7);
d6=wrcoef('d',c,l,'bior6.8',6);
d5=wrcoef('d',c,l,'bior6.8',5);
d4=wrcoef('d',c,l,'bior6.8',4);
d3=wrcoef('d',c,l,'bior6.8',3);
d2=wrcoef('d',c,l,'bior6.8',2);
d1=wrcoef('d',c,l,'bior6.8',1);
%% ��ͼ��ʾ���
figure('Color',[1 1 1]);
%����ԭʼʱ������
subplot(4,1,1);
plot(full_time_series_caojie,'LineWidth',2);
set(gca,'xtick',0:124:1488);
grid on;
axis tight;
xlabel('ʱ��(x6Сʱ)','fontsize',11);
ylabel('����(������/��)','fontsize',11);
title('��a��ԭʼʱ������','fontsize',11);
%��������ҵĲ���˵��ͻȻ��������������ĺ�壩������ʲôʱ��
%figure('Color',[1 1 1]);
subplot(4,1,2);
plot(d1,'LineWidth',2);
set(gca,'xtick',0:124:1488);
axis tight;
grid on;
xlabel('ʱ��(x6Сʱ)','fontsize',11);
ylabel('����������������/�룩','fontsize',11);
title('��b��һ��ϸ��','fontsize',11);
%������Ϊƽ���Ĳ����������ܹ���ӳʱ����������Ĳ������ԣ���壩
%figure('Color',[1 1 1]);
subplot(4,1,3);
plot(d4,'LineWidth',2);
set(gca,'xtick',0:124:1488);
axis tight;
grid on;
xlabel('ʱ��(x6Сʱ)','fontsize',11);
ylabel('����������������/�룩','fontsize',11);
title('��c���Ĳ�ϸ��','fontsize',11);
%������ʱ�����еĽ��ƣ���ӳ��ʱ�����е���������
%figure('Color',[1 1 1]);
subplot(4,1,4);
plot(a9,'LineWidth',2);
set(gca,'xtick',0:124:1488);
axis tight;
grid on;
xlabel('ʱ��(x6Сʱ)','fontsize',11);
ylabel('�������ƣ�������/��)','fontsize',11);
title('��d���Ų����','fontsize',11);
%%
clear 
