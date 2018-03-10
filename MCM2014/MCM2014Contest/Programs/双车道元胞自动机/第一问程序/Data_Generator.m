%%%%%%%%%% ������ͨ���������÷��溯����ȡ��ͬ�ܶ��µ�ƽ��������Ϣ  %%%%%%%%%%%%%%

%% �����������
data_num = 80;        %�������ݵ���Ŀ
car_num_lb = 20;       %���峵�����½�
car_num_ub = 800;      %���峵�����Ͻ�
L=500;                 %����Ԫ����Ŀ

Nstep = floor((car_num_ub - car_num_lb) / data_num); %���㳵�����仯�Ĳ���
N=car_num_lb;                            %��ʼ���������±߽�
exp_num=6;                               %�ظ��������

data_matrix=zeros(2,exp_num*data_num);

for i=1:data_num
    for j=1:exp_num
    
    
    
        [velocity1,velocity2]=startsimulation(N);
        
        
        Velocity=[velocity1;velocity2];
        Velocity_mean = mean(mean(Velocity));
        
        data_matrix(1,(i-1)*data_num+j)=N / (2* L);
        data_matrix(2,(i-1)*data_num+j)=Velocity_mean;
        
        i
        j
    end
      N = N + Nstep; 
    
end

save data  data_matrix


