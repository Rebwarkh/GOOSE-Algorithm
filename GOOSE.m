
%*************************************************************************%
% GOOSE Algorithm source codes version 1.0                                %                                   %
% GOOSE: A GOOSE-inspired Optimization Algorithm                          %
% Authors: Rebwar Kh. Hamad, Tarik A. Rashid.                             %
% GOOSE is implemented by Rebwar Kh. Hamad                                %
% Developed in MATLAB R2019a(6.9.0)                                       %
%                                                                         %
% Cite as: Hamad, R.K., Rashid, T.A. GOOSE algorithm: a powerful          %
% optimization tool for real-world engineering challenges and beyond.     %
% Evolving Systems (2024). https://doi.org/10.1007/s12530-023-09553-6     %
%                                                                         %
% DOI:https://doi.org/10.1007/s12530-023-09553-6                          %
%*************************************************************************%


function [Best_score,Best_pos,Cong_Curve]=GOOSE(SearchAgents_no,Max_IT,lb,ub,dim,fobj)

Best_pos=zeros(1,dim);
Best_score=inf;                          %change this to -inf for maximization problems
M_T=inf;
Cong_Curve=zeros(1,Max_IT);
%Initialize the positions of search agents
X=initialization(SearchAgents_no,dim,ub,lb);
D_G=zeros(SearchAgents_no,dim);

loop=0;                                               % Loop counter

% Main loop
while loop<Max_IT

    for i=1:size(X,1)  

       % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=X(i,:)>ub;
        Flag4lb=X(i,:)<lb;
        X(i,:)=(X(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;               
    
        % Calculate objective function for each search agent
        fitness=fobj(X(i,:));
        
        
            if fitness<Best_score 
               Best_score=fitness;           
               Best_pos=X(i,:);                           

            end
      end     

    for i=1:size(X,1)        
        pro=rand;
        rnd=rand;
        coe=rand();
       if(coe<=0.17)
           coe;
       else
           coe=0.17;
       end
      S_W(i,:)=randi([5,25],1,1);                                          %Eq.(3.1)
      % Time of Arrive object to earth. 
      T_o_A_O(i,:)=rand(1,dim);                                            %Eq.(3.2)
      
      % Time of Arrive Sound to Groups
      T_o_A_S(i,:)=rand(1,dim);                                            %Eq.(3.3)
      
      T_T=(sum(T_o_A_S(i,:))+sum(T_o_A_O(i,:)))/dim;                       %Eq.(3.4)
      % Determine Time Average
      T_A=T_T/2;                                                           %Eq.(3.5)
      
      if rnd>=0.5
           
          if pro>0.2              
                  if S_W>=12
                        %  Calculate Free Fall Speed 
                        F_F_S=T_o_A_O(i,:) *(sqrt(S_W(i,:))* 9.81);        %Eq.(3.6)   
                        S_S=343.2;
                        D_S_T(i,:)=S_S* T_o_A_S(i,:);                      %Eq.(3.7)
                        D_G(i,:)=0.5* D_S_T(i,:);                          %Eq.(3.8)

                      X(i,:)=Best_pos-F_F_S + D_G(i,:)* T_A^2;             %Eq.(3.9)
                      
                    elseif S_W<12
             elseif pro<=0.2 
                        %  Calculate Free Fall Speed 
                        F_F_S=T_o_A_O(i,:) *(S_W(i,:)* 9.81);              %Eq.(3.10)
                        S_S=343.2;
                        D_S_T(i,:)=S_S* T_o_A_S(i,:);                      %Eq.(3.7)
                        D_G(i,:)=0.5* D_S_T(i,:);                          %Eq.(3.8)

                      X(i,:)=Best_pos+F_F_S.*D_G(i,:)* T_A^2*coe;          %Eq.(3.11)           
                      
                     end
              end
                     else

                        if M_T>T_T
                          M_T=T_T;
                        end
                     alpha=(2-(loop/(Max_IT/2)));                          %Eq.(3.12)
                     %random an awakening
                     % exploring wakeup without holding stone.
                     X(i,:)=Best_pos+randn(1,dim).*(M_T*alpha);            %Eq.(3.13)
        end 
    end
    loop=loop+1;
    Cong_Curve(loop)=Best_score;
end
  
    