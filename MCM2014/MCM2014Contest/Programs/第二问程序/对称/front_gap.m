function front_distance=front_gap(i,car,cells)
if car.road(i)==2
    row=1;
else
    row=2;
end
if ~sum(cells.position(row,:)>0)%�����Ԫ�ظ�����ȡ�߼���
    front_distance=inf;
else
    lie=car.position(i);
    front_distance=-1;
    while cells.position(row,lie)==0
        front_distance=front_distance+1;
        if lie+1>cells.cell_num
            lie=lie+1-cells.cell_num;
        else
            lie=lie+1;
        end
    end
end
