x=0.01:0.001:1;
S=3000;
A=100;
[a0,f0]=ymianji(S,x,A);%Բ
[a3,f3]=smianji(S,x,A);%������
[a4,f4]=zmianji(S,x,A);%������
[a5,f5]=wmianji(S,x,A);%�����
[a6,f6]=lmianji(S,x,A);%������
[a7,f7]=duomianji(S,x,A,7);%�߱���
[a8,f8]=bmianji(S,x,A);%�˱���
[a9,f9]=duomianji(S,x,A,9);%�ű���
[a10,f10]=duomianji(S,x,A,10);%ʮ����
%   a�������ʣ�f�������������

