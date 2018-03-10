%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����������չʾ�Ż����ȹ���
load data_month 
load x_best
x=xm;
r=1e8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �����Ž����Ŀ�꺯�����м���
[result,violent,n,discharge,Em,Es]=target_maxf(x,r);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% չʾ����󷢵���
result=num2str(result);
disp(strcat('�귢������','=',result));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% չʾ�Ż����ȷ���(����Ϊ���߱���12*4)
%(���뷽ʽ) μ��->����->�ݽ�->����
fprintf('���ŵ��ȷ���:\n');
x=zeros(12,4);
for i=1:12
    for j=1:4
        x(i,j)=xm((i-1)*4+j);
    end
end
x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% չʾÿ����վÿ���µ���ˮ
d=discharge;
discharge=zeros(12,4);
fprintf('��ˮ���:\n');
for i=1:12
    for j=1:4
        discharge(i,j)=d((i-1)*4+j);
    end
end
discharge
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����ÿ����վ�³���
c=3600000;
es=Es/c;
Es=zeros(12,4);
fprintf('����վ�³���:\n');
for i=1:12
    for j=1:4
        Es(i,j)=es((i-1)*4+j);
    end
end
Es
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��ͼչʾһ��ĳ������̣����ݱ仯��
figure('Color',[1 1 1]);
plot(x(:,1),'b-*','linewidth',2,'markersize',8);
hold on;
plot(x(:,2),'r-x','linewidth',2,'markersize',8);
plot(x(:,3),'k--o','linewidth',2,'markersize',8);
plot(x(:,4),'m--+','linewidth',2,'markersize',8);
xlabel('�·�');
ylabel('����(������)');
legend('μ��','����','�ݽ�','����');
title('�ݼ�ˮ��ʱ�ο��ݱ仯����');
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��ͼչʾÿ���µķ����� �͸���վ���·�����
figure('Color',[1 1 1]);
plot(Em/c,'b-','linewidth',2);
hold on;
plot(Es(:,1),'b-*','linewidth',2,'markersize',8);
plot(Es(:,2),'r-x','linewidth',2,'markersize',8);
plot(Es(:,3),'k--o','linewidth',2,'markersize',8);
plot(Es(:,4),'m--+','linewidth',2,'markersize',8);
xlabel('�·�');
ylabel('������(KW/H)')
legend('���ܷ�����','μ���·�����','�����·�����','�ݽ��·�����','�����·�����');
title('�·������仯����');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��ͼչʾÿ���µ���ˮ���͸���վ����ˮ��
t=31*24*60*60;
figure('Color',[1 1 1]);
plot(weituo_month*t,'b','linewidth',2);
hold on;
plot(lize_month*t,'r','linewidth',2);
plot(luoduxi_month*t,'k','linewidth',2);
plot(discharge(:,1),'b-*','linewidth',2,'markersize',8);
plot(discharge(:,2),'r-x','linewidth',2,'markersize',8);
plot(discharge(:,3),'k--o','linewidth',2,'markersize',8);
plot(discharge(:,4),'m--+','linewidth',2,'markersize',8);
xlabel('�·�');
ylabel('ˮ��(������)');
legend('μ����ˮ��','������ˮ��','�޶�Ϫ��ˮ��','μ����ˮ��','������ˮ��','�ݽ���ˮ��','������ˮ��');
title('��ˮ������ˮ������');
hold off;