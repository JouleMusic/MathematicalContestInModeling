%%%%%%%%%%%%%%%  �������ڼ���ƥ���������   %%%%%%%%%%%%%%%%%%%%%%
function counterf(result)
%%%%%%%%%%%%PP��һ�����ж��е����� resultҲ��һ�����ж��е����� 
%%%%%%%%%%%%��������������֮��Ĺ�ϵ
%% ���� ����
len=length(result);
[Y,index]=sort(result(:,1));
result=[Y,result(index(:),2)];
[N C]=hist3(result);

PP=zeros(1,length(N));
for i=1:length(PP)
    temp=find(N(i,:)==max(N(i,:)));
    floor(C{2}(temp(1))-0.5)
end
result 
hist3(result)
