function hei=tuhei(I)
%IΪԪ��������Ϊһ��������Ϊ�����ʽ��ͬ��Ԫ������
%heiΪͿ���˵�Ԫ��
% global I m1 hei
m1=I{1};
hei=I;
[hhh,lll]=size(m1);
linshi=255*ones(1,lll);
mudi=zeros(1,lll);
[~,pppppp]=size(I);
for i=1:pppppp
    j=1;
    while j<hhh+1
    if hei{i}(j,:)==linshi
    else
        hei{i}(j,:)=mudi;
    end
    j=j+1;
    end
end

% bound=zeros(hhh,209);
% for i=1:209
%     bound(:,i)=hei{i}(:,1);
% end
% bound=bound';
% clear  i mudi linshi j hhh lll