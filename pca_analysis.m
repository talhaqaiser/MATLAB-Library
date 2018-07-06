function [pca_out] =  pca_analysis(pca_in, components)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fucntion for counting number of lines 
% in CSV
%
% Input:
% pca_in      	- PCA input 
% components	- no of required components 
%
% Output:
% pca_out          - principle components of  a given data 
% Talha Qaiser
% TIAlab, Department of Computer Science, 
% University of Warwick
% Ref:http://matlabdatamining.blogspot.co.uk/2010/02/principal-components-analysis.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[n m] = size(pca_in);
mean_pca_in = mean(pca_in);
std_pca_in = std(pca_in);
pca_out = (pca_in - repmat(mean_pca_in,[n 1])) ./ repmat(std_pca_in,[n 1]); % alternatively B = zscore(A)

[coeff,score,latent,tsquared] = pca(pca_out,'NumComponents',components);


% reconstruct
%  pca_out * COEFF
%  (pca_out * COEFF) * COEFF'

% to get back the data
% ((pca_out * COEFF) * COEFF') .* repmat(std_pca_in,[n 1]) + repmat(mean_pca_in,[n 1])

pca_out =  score;
end
