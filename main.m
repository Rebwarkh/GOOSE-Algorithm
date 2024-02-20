
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

clc;
clear;
close all;

% Change these details with respect to your problem
sums=0;
avgs=0;
for i=1:30    
SearchAgents_no=10;            % Number of search agents
Function_name='F1';            % Name of the test function that can be chnage..
Max_IT=500;                    % Maximum number of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);           %where lb is the lower bound of variable, ub is the upper bound of variable and dim is the number of dimension
[Best_score,Best_pos,Cong_Curve]=GOOSE(SearchAgents_no,Max_IT,lb,ub,dim,fobj);

display( num2str(Best_score));       
sums=sums+Best_score;
end

 avgs=sums/30;
 [avgs]
 display( num2str(avgs));

% Draw chart
figure('Position',[400 400 560 190])

%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title(['Test Function: ',Function_name])
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
grid on

%Draw objective space
subplot(1,2,2);
semilogy(Cong_Curve,'Color','r')
title('Convergence curve')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid off
box on
legend('GOOSE')

