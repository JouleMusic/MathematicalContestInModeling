function [car,cells,basic]=traffic_simulation(car,cells,basic)

%���ٹ���
[car,cells] = speed_up(car,cells,basic);

%�������
 [car,cells,basic ] = ChangeRoad(car,cells,basic);

%���ȼ��ٹ���
[car,cells] = force_slow_down(car,cells);

%�������
[car,cells] = rand_slow_down(car,cells,basic);

%λ�ø���
[car,cells] = update_position(car,cells);
