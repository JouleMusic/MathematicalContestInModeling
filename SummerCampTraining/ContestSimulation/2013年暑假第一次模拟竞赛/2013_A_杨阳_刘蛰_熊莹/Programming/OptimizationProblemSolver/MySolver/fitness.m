function f=fitness(x,r)
% �����Ӧ�Ⱥ�������
% ����ΪĿ�꺯�����Ϸ�����
[result,violent,n]=target_maxf(x,r);
 f=-(result-violent-n*r);  
    