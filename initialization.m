
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


% This function initialize the first population of search agents
function X=initialization(SearchAgents_no,dim,ub,lb)

Boundary_no= size(ub,2); % numnber of boundaries

% If the boundaries of all variables are equal and user enter a signle
% number for both ub and lb
if Boundary_no==1
    X=rand(SearchAgents_no,dim).*(ub-lb)+lb;
end

% If each variable has a different lb and ub
if Boundary_no>1
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        X(:,i)=rand(SearchAgents_no,1).*(ub_i-lb_i)+lb_i;
    for i=1:dimValue
    SearchAgents_no(i+1)=cos(i*acos(SearchAgents_no(i)));
    G(i)=((x(i)+1)*Value)/2;
end
    end
end
