% #2
function [car,cells,basic ] = ChangeRoad(car,cells,basic)
%%
 dsafe=2;

%% ���б��
for i=1:car.car_num
    Front=front_gap(i);
    Back=back_gap(i);
    Gap=gap(i);
    ChangeFlag=0; 
   if cars.road(i)==2 %>>>>>>>>>>>>>>>>> �쳵�������Ҳ� <<<<<<<<<<<<<<<<<<<<<<<% R->L:  
         
         if (cars.velocity(i)>Gap)&&...
                 (Front>car.velocity(i))&&...
                 (Front>Gap)&&(Back>dsafe)           %���㻻��׼��
             
              rand('state',sum(100*clock)*rand(1));  %�����������
              p_rand=rand;%�����������
             
              if p_rand<Lanechange_probability(2)    %���������Ҫ��
                                           
              %%%%%%%%%%%%% ���󻻵� %%%%%%%%%%%%%%%%%
                                        % ��������
                                        
                                        % Ԫ������
                  
                      Changeflag=1;     %���󻻵�������1
                      basic.change_frenquency=basic.change_frenquency+1;   %������������������
               end
         else
               
              ChangeFrame=0;    %�����㻻���Ͳ�������󻻵�������0   
         end 
         
         
         
    
   else %>>>>>>>>>>>>>>>>>>>> ��⵽������� <<<<<<<<<<<<<<<<<<<<% L->R:
        
        if (ChangeFrame==0)&&(cars.velocity(i)>Gap)&&...
                 (Front>car.velocity(i))&&...
                 (Front>Gap)&&(Back>dsafe)           %���㻻��׼��
             
              rand('state',sum(100*clock)*rand(1));  %�����������
              p_rand=rand;                           %�����������
             
              if p_rand<Lanechange_probability(1)    %���������Ҫ��
                                           
              %%%%%%%%%%%%% ���һ��� %%%%%%%%%%%%%%%%%
                                        % ��������
                                        
                                        % Ԫ������
                  
                    
                     basic.change_frenquency=basic.change_frenquency+1;   %������������������
              end
              
             else
               
                                         %�����㻻���Ͳ�������һ���  
         end       
        
    end
    
                               
    
end


end


  cells.position(car.road(i),car.position(i))=true;   
    cells.position(car.road(i),car.position(i))=true;
    cells.velocity(car.road(i),car.position(i))=car.velocity(i);
