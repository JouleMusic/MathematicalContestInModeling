function wide=suanwide(hei)
%heiΪͿ���˵ľ��󣬲���Ԫ��
%���ؾ��󣬾���Ԫ��������Ϊ������ȣ�ż����Ϊ�������
qqq=hei(:,1);
i=1;k=1;
len=length(qqq);

while i<len+1
    j=0;
while (i<len+1)&&qqq(i)==255
    i=i+1;
    j=j+1;
end
wide(k)=j;
j=0;
while (i<len+1)&&qqq(i)==0
    i=i+1;
    j=j+1;
end
wide(k+1)=j;
k=k+2;
end



        
        