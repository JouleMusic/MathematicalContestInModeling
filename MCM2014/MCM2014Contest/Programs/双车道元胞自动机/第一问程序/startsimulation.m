function [velocity1,velocity2]=startsimulation(N)

%% ����ϵͳ��ʼ�����������ɸ��ֽṹ

[cells,car,cells_result,basic]=system_initialize(N);
%position1=zeros(basic.simulation_time,cells.cell_num);
velocity1=zeros(basic.simulation_time,cells.cell_num);
%position2=zeros(basic.simulation_time,cells.cell_num);
velocity2=zeros(basic.simulation_time,cells.cell_num);
cells_velocity=cells_result;
%% ����
for i=1:basic.simulation_time
    
    cells_result{i}=cells.position;%��¼���
    cells_velocity{i}=cells.velocity;
    [car,cells,basic]=traffic_simulation(car,cells,basic);%���÷��溯��
    
end

%%
for i=1:basic.simulation_time
%    position1(i,:)=cells_result{i}(1,:);
%    position2(i,:)=cells_result{i}(2,:);    
    velocity1(i,:)=cells_velocity{i}(1,:);
    velocity2(i,:)=cells_velocity{i}(2,:);
end