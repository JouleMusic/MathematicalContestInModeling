function xm=CLSPSO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����PSO�����Ż��㷨
%���Ż�������target_maxf
%������Ŀ��N
%����Ȩ�أ�w
%ѧϰ����1��c1
%ѧϰ����2��c2
%�Ա�������������ֵ��xmax
%�Ա������������Сֵ��xmin
%����������:M
%���������������:MaxC
%�����ά����D
%�ͷ�ϵ��r
%Ŀ�꺯��ȡ��Сֵʱ���Ա���ֵ��x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �����㷨����
tic;
N=200;
D=48;
w=0.8;
c1=1;
c2=1;
M=500;
MaxC=100;
r=1e8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ������ʾ����
format long;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��ʼ������
x=zeros(N,D);  %��¼��Ⱥλ��
v=x;           %��¼��Ⱥ�ٶ�
p=zeros(1,N);  %��¼���Ӿֲ������Ӧ��
y=x;           %��¼���Ӿֲ����λ��
Iteration=0;   %��¼��������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �����ʼ��λ��
for i=1:N
    for j=1:4:D
        x(i,j)=  unifrnd(0.1390e8,0.193e8);
        x(i,j+1)=unifrnd(0.4922e8,0.5773e8);
        x(i,j+2)=unifrnd(6.8333e8,7.4667e8);
        x(i,j+3)=unifrnd(1.2095e8,1.4952e8);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �����ʼ���ٶ�
for i=1:N
    for j=1:4:D
        v(i,j)=  unifrnd(0.0090e8,0.0093e8);
        v(i,j+1)=unifrnd(0.004922e8,0.00773e8);
        v(i,j+2)=unifrnd(0.08333e8,0.04667e8);
        v(i,j+3)=unifrnd(0.02095e8,0.04952e8);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �����ʼֵ
for i=1:N
    p(i)=fitness(x(i,:),r);       
    y(i,:)=x(i,:);
end
pg=x(N,:);                  %pgΪȫ�����Ŷ�Ӧ������
for i=1:(N-1)
    if fitness(x(i,:),r)<fitness(pg,r)
        pg=x(i,:);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% �����ٶ����� 20%
vmax=zeros(1,D);
vmin=zeros(1,D);
for j=1:4:D
        vmin(j)=0.2*  (0.1390e8-0.193e8);
        vmin(j+1)=0.2*(0.4922e8-0.5773e8);
        vmin(j+2)=0.2*(6.8333e8-7.4667e8);
        vmin(j+3)=0.2*(1.2095e8-1.4952e8);
        vmax(j)=-vmin(j);
        vmax(j+1)=-vmin(j+1);
        vmax(j+2)=-vmin(j+2);
        vmax(j+3)=-vmin(j+3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����λ������
lb=zeros(1,D);
ub=zeros(1,D);
for j=1:4:D
        lb(j)=  0.1390e8;
        lb(j+1)=0.4922e8;
        lb(j+2)=6.8333e8;
        lb(j+3)=1.2095e8;
        ub(j)=  0.1930e8;
        ub(j+1)=0.5773e8;
        ub(j+2)=7.4667e8;
        ub(j+3)=1.4952e8;
end
xmax=ub;
xmin=lb;
figure('Color',[1 1 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��ѭ��
for t=1:M
    for i=1:N
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));  %�����ٶ�
        for k=1:D
           if v(i,k)>vmax(k)  
                 v(i,k)=vmax(k);            %�ٶ�����
           end
           if v(i,k)<vmin(k)
                 v(i,k)=vmin(k);
           end
        end   
        x(i,:)=x(i,:)+v(i,:);                                         %����λ��
        for k=1:D
            if x(i,k)>ub(k)
                x(i,k)=ub(k);      %λ������
            end
            if x(i,k)<lb(k)
                x(i,k)=lb(k);
            end
        end
        fv(i)=fitness(x(i,:),r);                                      %������Ӧ��
    end
    [sort_fv,index]=sort(fv);
    Nbest=floor(N*0.2);                 %����Ⱥ����20%���������
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for n=1:Nbest                       %��Ⱥ����20%��������ӽ��л�������
        tmpx=x(index(n),:);
        for k=1:MaxC                    %���������������
            for dim=1:D                 %���������ĵ�����ʽ
                cx(dim)=(tmpx(1,dim)-xmin(dim))/(tmpx(1,dim)-xmax(dim));
                cx(dim)=4*cx(dim)*(1-cx(dim));
                tmpx(1,dim)=tmpx(1,dim)+cx(dim)*(xmax(dim)-xmin(dim));
            end
            fcs=fitness(tmpx,r);
            if fcs<sort_fv(n)           %�Ի���������ľ��߱���ֵ��������
                x(index(n),:)=tmpx;
                break;
            end
        end
        x(index(n),:)=tmpx;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=1:N  
       for k=1:D
            if x(i,k)>ub(k)
                x(i,k)=ub(k);      %λ������
            end
            if x(i,k)<lb(k)
                x(i,k)=lb(k);
            end
            
       end
    end
    r=rand();
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for s=1:D                           %������������
        xmin(s)=max(xmin(s),pg(s)-r*(xmax(s)-xmin(s)));
        xmax(s)=min(xmax(s),pg(s)+r*(xmax(s)-xmin(s)));
    end
    x(1:Nbest,:)=x(index(1:Nbest),:);
    for i=(Nbest+1):N                         %�������ʣ���80%΢��
        for j=1:D
            x(i,j)=xmin(j)+rand*(xmax(j)-xmin(j));      %�����ʼ��λ��
            v(i,j)=0.2*rand*(xmax(j)-xmin(j));          %�����ʼ���ٶ�
        end
    end
    
  for i=1:N
      for k=1:D
           if v(i,k)>vmax(k)  
                 v(i,k)=vmax(k);            %�ٶ�����
           end
           if v(i,k)<vmin(k)
                 v(i,k)=vmin(k);
           end
      end
       
      for k=1:D
           if x(i,k)>ub(k)
                x(i,k)=ub(k);      %λ������
           end
           if x(i,k)<lb(k)
                x(i,k)=lb(k);
           end
     end
  end
    Pbest(t)=fitness(pg,r);
    for i=1:N
        if fitness(x(i,:),r)<p(i)
            p(i)=fitness(x(i,:),r);
            y(i,:)=x(i,:);
        end
        if p(i)<fitness(pg,r)
            pg=y(i,:);
        end
    end
    Iteration=Iteration+1;             %�㷨��������������
    plot(Iteration,fitness(pg,r),'b*');
    hold on;
    w=0.9-(0.9-0.4)*(Iteration/M)^2;                            %����Ȩ��
end
hold off;
xm=pg;
save x_best xm
toc;