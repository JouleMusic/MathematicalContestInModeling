%3,����ģ��  (���ڿ����е�)
 function  vihcle_space=ChangeRoad(i,j,cell,roadVihcleNumChain,basicInfor,vihcle_space,probily,istep)
 %% set parameters
dsafe=3;
 
 
 %% ��ʼ������
 if j>1
     CellFront=vihcle_space.position(roadVihcleNumChain(i,j-1))-vihcle_space.position(roadVihcleNumChain(i,j))-1;
 else
     CellFront=basicInfor.cells-vihcle_space.position(roadVihcleNumChain(i,j))-1;
 end
 if i>1
     CellLeftFront=cellLeftFront(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%�����󳵵���ǰ���ľ���
     CellLeftBack=cellLeftBack(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%�����󳵵���󳵵ľ���
 else
     CellLeftFront=-2;
     CellLeftBack=-2;
 end
 if i<basicInfor.road
     CellRightFront=cellRightFront(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%�����ҳ�����ǰ���ľ���
     CellRightBack=cellRightBack(i,j,cell,vihcle_space,basicInfor,roadVihcleNumChain);%�����ҳ�����󳵵ľ���
 else
     CellRightFront=-2;
     CellRightBack=-2;
 end
 
 %% ���
 ChangeFrame=0;
 if  (CellLeftFront>vihcle_space.v(roadVihcleNumChain(i,j)))...
         &&(CellLeftBack>=dsafe)
     rand('state',sum(100*clock)*rand(1));%�����������
     p_rand=rand;%�����������
     if p_rand<probily.Cprobily(1+vihcle_space.v_frame(roadVihcleNumChain(i,j)))+0.5
            vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j))-1;
            vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
            ChangeFrame=1;%���󻻵�
     else
         vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j));
         vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
            ChangeFrame=0;
     end
 else if (ChangeFrame==0)&&(vihcle_space.v(roadVihcleNumChain(i,j))>CellFront)...
             &&(CellRightFront>vihcle_space.v(roadVihcleNumChain(i,j)))...
             &&(CellRightFront>CellFront)&&(CellRightBack>=dsafe)
      rand('state',sum(100*clock)*rand(1));%�����������
      p_rand=rand;%�����������
     if p_rand<probily.Cprobily(1+vihcle_space.v_frame(roadVihcleNumChain(i,j)))-0.3
            vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j))+1;%���һ���
            vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
     else
         vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j));
         vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
     end
     else
         vihcle_space.road_num(roadVihcleNumChain(i,j))=vihcle_space.road_num(roadVihcleNumChain(i,j));
         vihcle_space.VihcleRecord(roadVihcleNumChain(i,j),3,(1+istep-vihcle_space.VihcleInOut(1,roadVihcleNumChain(i,j))))=vihcle_space.road_num(roadVihcleNumChain(i,j));
     end
 end