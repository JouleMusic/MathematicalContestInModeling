%���floyd�㷨�ĺ�������,sΪԴ��,tΪ�޵�
%LΪ����,RΪ·��
function [L,R]=router(D,path,s,t)
L=zeros(0,0);
R=s;
while 1
    if s==t
        L=fliplr(L);
        L=[0,L];
        return
    end
    L=[L,D(s,t)];
    R=[R,path(s,t)];
    s=path(s,t);
end