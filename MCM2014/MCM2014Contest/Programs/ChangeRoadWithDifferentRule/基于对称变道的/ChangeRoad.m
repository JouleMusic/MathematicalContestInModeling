% #2
function [new_car,new_cells,basic ] = ChangeRoad(car,cells,basic)
new_car=car;
new_cells=cells;

%%
 dsafe=1;

%% ���б��
for i=1:car.car_num
    Front=front_gap(i,car,cells);
    Back=back_gap(i,car,cells);
    Gap=gap(i,car,cells);
    ChangeFlag=0; 
   if car.road(i)==2 %>>>>>>>>>>>>>>>>> �쳵�������Ҳ� <<<<<<<<<<<<<<<<<<<<<<<% R->L:  
         
         if (car.velocity(i)>Gap)&&...
                 (Front>car.velocity(i))&&...
                 (Front>Gap)&&(Back>=dsafe)           %���㻻��׼��
             
              rand('state',sum(100*clock)*rand(1));  %�����������
              p_rand=rand;%�����������
             
              if p_rand<basic.Lanechange_probability(2)    %���������Ҫ��
                                           
              %%%%%%%%%%%%% ���󻻵� %%%%%%%%%%%%%%%%%
                 new_car.road(i)=1;                       % ��������
                 new_cells.potision(new_car.road(i)+1,new_car.position(i))=false;                  
                 new_cells.potision(new_car.road(i),new_car.position(i))=true;             % Ԫ������
                 new_cells.velocity(car.road(i),car.position(i))=car.velocity(i); 
                      ChangeFlag=1;     %���󻻵�������1
                      basic.change_frenquency(2)=basic.change_frenquency(2)+1;   %������������������
               end
         else
               
              ChangeFlag=0;    %�����㻻���Ͳ�������󻻵�������0   
         end 
         
         
         
    
    else %>>>>>>>>>>>>>>>>>>>> ��⵽������� <<<<<<<<<<<<<<<<<<<<% L->R:
         
         if (ChangeFlag==0)&&(car.velocity(i)>Gap)&&...
                  (Front>car.velocity(i))&&...
                  (Front>Gap)&&(Back>=dsafe)           %���㻻��׼��
              
               rand('state',sum(100*clock)*rand(1));  %�����������
               p_rand=rand;                           %�����������
              
               if p_rand<basic.Lanechange_probability(1)    %���������Ҫ��
                                            
               %%%%%%%%%%%%% ���һ��� %%%%%%%%%%%%%%%%%
                new_car.road(i)=2;                         % ��������
                 new_cells.potision(new_car.road(i)-1,new_car.position(i))=false;                  
                  new_cells.potision(new_car.road(i),new_car.position(i))=true;             % Ԫ������
                  new_cells.velocity(car.road(i),car.position(i))=car.velocity(i); 
                     
                      basic.change_frenquency(1)=basic.change_frenquency(1)+1;   %������������������
               end
               
              else
                
                                          %�����㻻���Ͳ�������һ���  
          end       
        
    end
    
                               
    
end

end


 
    
