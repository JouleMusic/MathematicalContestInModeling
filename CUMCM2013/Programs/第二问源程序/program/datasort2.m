%%%%%%%%%%%%%%%%%%%%%   �ڶ��ʳ����      %%%%%%%%%%%%%%%%%%%%%%%%
%% ͼ���������� 
load data1     %%%%���ر����еĺ���ͼ�� һ��Ԫ�����鴢�������е�ͼƬ
%load data2     %%%%���ر����е�Ӣ�ģ�һ��Ԫ�����鴢��������ͼƬ
len=length(Imgcellmatrix);
for i=1:len
    Imgcellmatrix{i}=double(Imgcellmatrix{i});
end
%% ���ÿ��ͼ�������ݶ�ֵ
Gradientcell=cell(size(Imgcellmatrix));%һ��Ԫ���������ڴ洢������ͼ����ݶ�ֵ 
for i=1:len
    Gradientcell{i}=gradient(Imgcellmatrix{i});
end
%% 


%%



%%



%%