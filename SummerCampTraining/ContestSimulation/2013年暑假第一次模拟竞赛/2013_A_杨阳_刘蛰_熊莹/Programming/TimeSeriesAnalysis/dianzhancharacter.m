%����ˮλ��������ƺ���
%ͨ��������Ͻ����Ѿ��õ���������ߵ�ϵ���ṹ��
%������dianzhancharacter.mat�ļ���
load dianzhancharacter.mat
format rat
%% jinkou
figure('Color',[1 1 1]);
plot(jinkou(:,2),jinkou(:,1),'ro');hold on;
xx=jinkou(1,2):100:jinkou(length(jinkou(:,2)),2);
yy=polyval(jinkoufit.coeff,(xx-94873)/80252);
plot(xx,yy,'b');
title('����ˮ��ˮλ-�����������');
xlabel('���ݣ��������ף�');
ylabel('ˮλ���ף�');
legend('ˮλ-�������ݵ�','�������');
grid on;
syms X x
jinkou=vpa(poly2sym(jinkoufit.coeff),10);
x=(X-94873)/80252;
jinkou=subs(jinkou,x)
%% caojie
figure('Color',[1 1 1]);
plot(caojie(:,2),caojie(:,1),'ro');hold on;
xx=caojie(1,2):100:caojie(length(caojie(:,2)),2);
yy=polyval(caojiefit.coeff,(xx-1.0267e+05)/ 1.0481e+05);
plot(xx,yy,'b');
title('�ݽ�ˮ��ˮλ-�����������');
xlabel('���ݣ��������ף�');
ylabel('ˮλ���ף�');
grid on;
caojie=vpa(poly2sym(caojiefit.coeff),10);
x=(X-1.0267e+05)/1.0481e+05;
caojie=subs(caojie,x)
%% weituo
figure('Color',[1 1 1]);
plot(weituo(:,2),weituo(:,1),'ro');hold on;
xx=weituo(1,2):10:weituo(length(weituo(:,2)),2);
yy=polyval(weituofit.coeff,xx);
plot(xx,yy,'b');
title('μ��ˮ��ˮλ-�����������');
xlabel('���ݣ��������ף�');
ylabel('ˮλ���ף�');
grid on;
weituo=vpa(poly2sym(weituofit.coeff),10);
weituo=subs(weituo,X)
%% lize
figure('Color',[1 1 1]);
plot(lize(:,2),lize(:,1),'ro');hold on;
xx=lize(1,2):100:lize(length(lize(:,2)),2);
yy=polyval(lizefit.coeff,(xx-11124)/12032);
plot(xx,yy,'b');
title('����ˮ��ˮλ-�����������');
xlabel('���ݣ��������ף�');
ylabel('ˮλ���ף�');
grid on;
lize=vpa(poly2sym(lizefit.coeff),10);
x=(X-11124)/12032;
lize=subs(lize,x)
%%
clear 