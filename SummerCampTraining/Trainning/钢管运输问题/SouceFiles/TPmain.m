function [W,path1,path2,c]=TPmain
%% ���ݴ�������7x15���ٷ��þ���
load  transportdata
a=[];path=[];w=[];
[a,path1]=TFloydfunction(A);
C=0.1*C;
C(find(C==0))=Inf;
for i=1:length(C)
    C(i,i)=0;
end
for i=1:length(C)
    for j=1:length(C)
      w(i,j)=min(a(i,j),C(i,j));
    end
end
w(find(w==0))=Inf;
for i=1:length(w)
    w(i,i)=0;
end
[W,path2]=Floyd(w);
c=W(1:7,8:22);
%% �������
fid=fopen('C:\Users\apple\Desktop\�ֹ���������\����.txt','wt');%д���ļ�·��
[m,n]=size(c);
 for i=1:m
    for j=1:n
       if j==n
         fprintf(fid,'%g\n',c(i,j));
      else
        fprintf(fid,'%g\t',c(i,j));
       end
    end
 end
fclose(fid);

fid=fopen('C:\Users\apple\Desktop\�ֹ���������\·��1.txt','wt');%д���ļ�·��
[m,n]=size(path1);
 for i=1:m
    for j=1:n
       if j==n
         fprintf(fid,'%g\n',path1(i,j));
      else
        fprintf(fid,'%g\t',path1(i,j));
       end
    end
 end
fclose(fid);

fid=fopen('C:\Users\apple\Desktop\�ֹ���������\·��2.txt','wt');%д���ļ�·��
[m,n]=size(path2);
 for i=1:m
    for j=1:n
       if j==n
         fprintf(fid,'%g\n',path2(i,j));
      else
        fprintf(fid,'%g\t',path2(i,j));
       end
    end
 end
fclose(fid);
save  path W c path1 path2;