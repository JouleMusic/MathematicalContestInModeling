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
ff=[f;f(1,:)];
plot(ff(:,1),ff(:,2))
grid on