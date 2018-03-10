%  ���ø�ʽ��[R,f]=dian(A,n)��AΪ�����nΪ����
%  R���ذ뾶
%  fΪ�������ÿ��Ϊһ�������
function [R,f]=dian(A,n)
if n<3||A<=0
    error('��������');
end
f=zeros(n,2);
R=sqrt(A/n/cos(pi/n)/sin(pi/n));
%% ������
if mod(n,2)
    for i=1:n
    f(i,:)=[R*cos(2*pi*i/n+pi/2),R*sin(2*pi*i/n+pi/2)]; 
    end
elseif mod(n,4)
    for i=1:n
    f(i,:)=[R*cos(2*pi*i/n),R*sin(2*pi*i/n)];
    end
else
    for i=1:n
    f(i,:)=[R*cos(2*pi*i/n+pi/n),R*sin(2*pi*i/n+pi/n)];
    end
    
    
    
end
%% ��ͼ���֣�������
figure('Color',[1 1 1]);
ff=[f;f(1,:)];
plot(ff(:,1),ff(:,2),'.-','linewidth',4,'markersize',30)
hold on;
plot(0,0,'.','markersize',20)
hold off
axis([-1*R-0.1*R,R+0.1*R,-1*R-0.1*R,R+0.1*R])
axis equal
grid on
format long
f

