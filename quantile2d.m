function [quan] =  quantile2d(input, q)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fucntion for counting number of lines 
% in CSV
%
% Input:
% input      		- 2D matrix 
% q					- quantile cut point
%
% Output:
% quan          	- output vector with quantile values
% Talha Qaiser
% BIAlab, Department of Computer Science, University of Warwick
% http://www2.warwick.ac.uk/fac/sci/dcs/people/research/talhaqaiser
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

quan =[];
for i=1:size(input,1)
    quan =  [quan; quantile(input(i,:),q)];
end
