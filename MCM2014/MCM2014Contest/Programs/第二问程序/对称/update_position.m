% #5
function [car,cells]=update_position(car,cells)
%����i��ʾ�ڼ�����������i˳��仯�������𷵻�car��������car�Ļ���
cells.position=zeros(2,cells.cell_num);
for i=1:car.car_num
    if car.position(i)+car.velocity(i)>cells.cell_num;
        car.position(i)=car.position(i)+car.velocity(i)-cells.cell_num;
    else
        car.position(i)=car.position(i)+car.velocity(i);
    end
    cells.position(car.road(i),car.position(i))=true;
    cells.velocity(car.road(i),car.position(i))=car.velocity(i);
end
    
    