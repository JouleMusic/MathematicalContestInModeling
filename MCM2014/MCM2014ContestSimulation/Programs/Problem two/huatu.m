%% huatu��x����xΪ0����Բ��3���������Σ�4���������Σ�6����������
function huatu(flag)
x=0.01:0.001:1;
S=3000;
A=100;
switch flag
case 0
    [a,f]=ymianji(S,x,A);
    figure('Color',[1 1 1]);
    plot(x,a)
    grid on;
    title('Բ������');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('Բ�ܸ���');
case 3
    [a,f]=smianji(S,x,A);
    figure('Color',[1 1 1]);
    plot(x,a)
    grid on;
    title('�����θ�����');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('�������ܸ���');
    case 4
    [a,f]=zmianji(S,x,A);
    figure('Color',[1 1 1]);
    plot(x,a)
    grid on;
    title('�����θ�����');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('�������ܸ���');
    case 6
        [a,f]=lmianji(S,x,A);
    figure('Color',[1 1 1]);
        plot(x,a)
    grid on;
    title('�����θ�����');
    figure('Color',[1 1 1]);
    plot(x,f)
    grid on;
    title('�������ܸ���');
end
        
        