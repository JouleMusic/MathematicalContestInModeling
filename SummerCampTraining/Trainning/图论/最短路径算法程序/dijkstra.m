function [min,path]=dijkstra(w,start,terminal)
% Input arguments w is weighted connected matrix and start
% is start point and terminal is terminal point in the graph
% Output Arguments min is the min cost and path is the Shortpath index 
%% initial varibales
n=size(w,1); label(start)=0; f(start)=start;   %labelΪ����ı�ǣ�fΪ����������
for i=1:n
   if i~=start
       label(i)=inf;
   end
end
s(1)=start; u=start;  %sΪ�Ѿ��������ã�P����ŵĶ��㣬uΪ����S�еĶ���
%% main loop
while length(s)<n    %�ж��Ƿ����ж��㶼�ѱ��
   for i=1:n
      ins=0;
      for j=1:length(s)
         if i==s(j)      %�ж���ȡ�õ��Ƿ���S������
            ins=1;
         end
      end
      if ins==0       %��ȡ�õ㲻��S������
         v=i;         %�����Ÿ�ֵ
         if label(v)>(label(u)+w(u,v))
            label(v)=(label(u)+w(u,v)); f(v)=u;
         end
      end
   end
   v1=0;
   k=inf;
   for i=1:n
         ins=0;
         for j=1:length(s)
            if i==s(j)
               ins=1; %�ж���ȡ�õ��Ƿ���S������    
            end
         end
         if ins==0
            v=i;
            if k>label(v)
               k=label(v);  v1=v; %�ھ��б�ŵĶ������ҵ���С��
            end
         end
   end
   s(length(s)+1)=v1;  %�Ծ���T��ŵĵ����P��ţ�����S���ϣ�
   u=v1;      
end
%% output
min=label(terminal); path(1)=terminal;
i=1; 
while path(i)~=start
      path(i+1)=f(path(i));
      i=i+1 ;
end
 path(i)=start;
L=length(path);
path=path(L:-1:1);