load path
load Grplotdata
load transportdata
A=triu(A);
C=triu(C);
M=A+C;
[edge]=A2Edge(M);
grPlot(S,edge);
title('ԭʼ����ͼ')

[edge]=A2Edge(triu(W));
grPlot(S,edge);
title('����һ��Floyd�㷨�������ͼ')