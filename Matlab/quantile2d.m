function [quan] =  quantile2d(input, q)
% Talha Qaiser
% BIAlab, Department of Computer Science, University of Warwick
% http://www2.warwick.ac.uk/fac/sci/dcs/people/research/talhaqaiser
% Ref:http://matlabdatamining.blogspot.co.uk/2010/02/principal-components-analysis.html

quan =[];
for i=1:size(input,1)
    quan =  [quan; quantile(input(i,:),q)];
end