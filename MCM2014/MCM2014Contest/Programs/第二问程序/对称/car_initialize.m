function [cells,car]=car_initialize(cells,car)
%�����������

%����i��ʾ�ڼ�����������i˳��仯�������𷵻�car��������car�Ļ���


for i=1:car.car_num
    rand_velocity=3;%��������ٶ�
    rand_road=1+round(rand());%������������ҵ�·
    rand_position=1+round(rand()*(cells.cell_num-1));%�������λ��
    
    while cells.position(rand_road,rand_position)==true %��֤����ͬһ�ص��ظ�����Ԫ��
        rand_road=1+round(rand());    
        rand_position=1+round(rand()*(cells.cell_num-1));
    end
    
    cells.position(rand_road,rand_position)=true;
    cells.velocity(rand_road,rand_position)=rand_velocity;
    car.velocity(i)=rand_velocity;
    car.road(i)=rand_road;
    car.position(i)=rand_position;
end