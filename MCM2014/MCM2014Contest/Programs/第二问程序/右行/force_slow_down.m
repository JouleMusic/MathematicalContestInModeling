% #3
function [car,cells]=force_slow_down(car,cells)
%����i��ʾ�ڼ�����������i˳��仯�������𷵻�car��������car�Ļ���
for i=1:car.car_num
    
    car.velocity(i)=min(car.velocity(i),gap(i,car,cells));
    cells.velocity(car.road(i),car.position(i))=car.velocity(i);
    
end