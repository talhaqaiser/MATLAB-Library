function [numLines] =  countCSVlines(filePath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fucntion for counting number of lines 
% in CSV
%
% Input:
% filePath      	- Path to CSV file
%
% Output:
% numLines          - Number of lines in provided CSV
%
%
% Talha Qaiser
% TIA Lab, Department of Computer Science, 
% University of Warwick, UK.
% http://www2.warwick.ac.uk/fac/sci/dcs/people/research/talhaqaiser
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~exist(filePath, 'file')
	numLines = -1;
	return; 
end	
fid = fopen(filePath, 'rb');

% Get file size
fseek(fid, 0, 'eof');
fileSize = ftell(fid);
frewind(fid);

% Read the whole file
data = fread(fid, fileSize, 'uint8');

% Count number of lines and increase by one
numLines = sum(data == 10) + 1;
fclose(fid);
end