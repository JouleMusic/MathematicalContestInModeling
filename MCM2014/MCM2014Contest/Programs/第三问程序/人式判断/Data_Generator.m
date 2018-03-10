%%%%%%%%%% ������ͨ���������÷��溯����ȡ��ͬ�ܶ��µ�ƽ��������Ϣ  %%%%%%%%%%%%%%

%% �����������
data_num = 40;        %�������ݵ���Ŀ
car_num_lb = 20;       %���峵�����½�
car_num_ub = 800;      %���峵�����Ͻ�
L=500;                 %����Ԫ����Ŀ

Nstep = floor((car_num_ub - car_num_lb) / data_num); %���㳵�����仯�Ĳ���
N=car_num_lb;                            %��ʼ���������±߽�
exp_num=10;                               %�ظ��������

data_matrix_velocity=zeros(data_num,exp_num,2);
data_matrix_Frenquency=zeros(data_num,exp_num,3);

for i=1:data_num
    for j=1:exp_num
    
    
        [velocity1,velocity2,Frenquency]=startsimulation(N);
        
        Velocity=[velocity1;velocity2];
        Velocity_mean = mean(mean(Velocity));
        
        data_matrix_velocity(i,j,1)=N / (2* L);
        data_matrix_velocity(i,j,2)=Velocity_mean;
        
        data_matrix_Frenquency(i,j,1)=N / (2* L);
        data_matrix_Frenquency(i,j,2)=Frenquency(1);
        data_matrix_Frenquency(i,j,3)=Frenquency(2);
    
    end
      N = N + Nstep; 
      disp(i)
    
end

save data  data_matrix_velocity data_matrix_Frenquency


