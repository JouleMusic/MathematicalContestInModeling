Imgcellmatrix=cell(1,209); 
for b=1:9    
    m1=imread(['00',int2str(b),'.bmp']); %m1��һ�����������᲻ͣ�ı���һ��ͼƬ��Ϣ������������һ��ͼƬ����Ϣ   
    Imgcellmatrix{b}=m1; %I{1}������I{9}����ÿһ��ͼƬ����Ϣ
end
for b=10:99
     m1=imread(['0',int2str(b),'.bmp']); %m1��һ�����������᲻ͣ�ı���һ��ͼƬ��Ϣ������������һ��ͼƬ����Ϣ   
     Imgcellmatrix{b}=m1; %I{1}������I{9}����ÿһ��ͼƬ����Ϣ
end
for b=100:208
     m1=imread([int2str(b),'.bmp']); %m1��һ�����������᲻ͣ�ı���һ��ͼƬ��Ϣ������������һ��ͼƬ����Ϣ   
     Imgcellmatrix{b}=m1; %I{1}������I{9}����ÿһ��ͼƬ����Ϣ
end
Imgcellmatrix{209}=imread('000.bmp');
clear b