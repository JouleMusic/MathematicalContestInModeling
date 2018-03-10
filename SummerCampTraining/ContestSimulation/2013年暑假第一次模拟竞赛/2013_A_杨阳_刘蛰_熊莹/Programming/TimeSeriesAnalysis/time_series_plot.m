%���ڶ�����ʱ�����н�����ʾ����
load flow_time_series
%% caojie day
figure('Color',[1 1 1]);
bar(full_time_series_caojie1);
set(gca,'xtick',0:31:372);
axis([0 372 0 13000]);
xlabel('ʱ��(��)');
ylabel('����(������/��)');
title('�ݽ���ƽ������ʱ������');
grid on;
%% luoduxi day
figure('Color',[1 1 1]);
bar(full_time_series_luoduxi);
set(gca,'xtick',0:31:372);
axis([0 372 0 30000]);
xlabel('ʱ��(��)');
ylabel('����(������/��)');
title('�޶�Ϫ��ƽ������ʱ������');
grid on;
%% caojie minus luoduxi 
figure('Color',[1 1 1]);
bar(full_time_series_caojie1-full_time_series_luoduxi);
set(gca,'xtick',0:31:372);
axis([0 372 -20000 10000]);
xlabel('ʱ��(��)');
ylabel('����(������/��)');
title('�ݽ��޶�Ϫ��ƽ��������ʱ������');
grid on;
%% caojie&luoduxi
figure('Color',[1 1 1]);
plot(full_time_series_luoduxi,'r--','linewidth',2)
hold on;
plot(full_time_series_caojie1,'b-','linewidth',2)
set(gca,'xtick',0:31:372);
axis([0 372 0 30000]);
legend('luoduxi','caojie')
grid on;
xlabel('ʱ��(��)');
ylabel('����(������/��)');
title('�ݽ����޶�Ϫ��ƽ������ʱ������');
%% caojie
figure('Color',[1 1 1])
plot(full_time_series_caojie)
hold on;
set(gca,'xtick',0:124:1488);
f=ezplot('6000',[0 1488]);
ezplot('9000',[0 1488]);
ezplot('13000',[0 1488]);
ezplot('28000',[0 1488]);
ezplot('57300',[0 1488]);
axis([0 1488 0 60000]);
legend('����ʱ������','բ�����з�ʽһ����','բ�����з�ʽ������','ȫ��ͣ��',...
    '���У�˺�ˮλ','��ƺ�ˮλ');
xlabel('ʱ��(x6Сʱ)');
ylabel('����(������/��)');
title('�ݽ�6Сʱƽ������ʱ������');
clear;