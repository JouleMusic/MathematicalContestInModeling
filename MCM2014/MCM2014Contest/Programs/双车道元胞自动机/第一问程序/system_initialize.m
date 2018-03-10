function [cells,car,cells_result,basic]=system_initialize(N)

%% �����������
car_num=N;%��������
cell_num=500;%ÿ�е�Ԫ����Ŀ
simulation_time=1000;%����ʱ��
v_hope=5;%���������ٶ�
a_probability=0.8;%���������ٸ���
rand_slow_probability=0.25;%�����������
Lanechange_probability=[0.9 0.3];   %�������Ļ�������
change_frenquency=[0,0];%����Ƶ��
vmax=[5,4];

%% �ṹ�嶨��
% �����ṹ��
car=struct('car_num',car_num,'velocity',zeros(1,car_num),'v_hope',v_hope*ones(1,car_num),'road',zeros(1,cell_num),'position',zeros(1,cell_num));
% Ԫ���ṹ��
cells=struct('cell_num',cell_num,'position',zeros(2,cell_num),'velocity',zeros(2,cell_num),'vmax',vmax);
% ���ݼ�¼�ṹ��
cells_result=cell(simulation_time,1);
% ���������ṹ��
basic=struct('simulation_time',simulation_time,'a_probability',a_probability,...
    'rand_slow_probability',rand_slow_probability,'change_frenquency',change_frenquency,...
    'Lanechange_probability',Lanechange_probability);

%%  ��ʼ��Ԫ������ 
% Ԫ������ʼ����
[cells,car]=car_initialize(cells,car);