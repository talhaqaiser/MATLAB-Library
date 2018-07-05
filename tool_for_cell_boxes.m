%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Talha Qaiser
% Department of Computer Science, 
% University of Warwick, UK.
% http://www2.warwick.ac.uk/fac/sci/dcs/people/research/talhaqaiser
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear 
close all

dir_path = 'C:\';
dir_list =  dir([dir_path '*.png']);
out_dir = '';

X_min = []; Y_min = [];
W = [];     H = [];  
for i=273:2:length(dir_list)
    i
    img_name = dir_list(i).name;
    img_path = strcat(dir_path, img_name);
    
    img = imread(img_path);
    figure,imshow(img)
           
    while true
        k=get(gcf,'CurrentCharacter');
        if k=='a'
           set(gcf,'CurrentCharacter','@');
           X_min = [];
           Y_min = [];
           W = [];
           H = [];    
           close all
           figure,imshow(img)
        elseif (k=='q')
           set(gcf,'CurrentCharacter','@');
           break;
        else
          rect = getrect;
          hold on; % Prevent image from being blown away.
          rectangle('Position', rect, 'EdgeColor','r');
          X_min = [X_min; rect(1)];
          Y_min = [Y_min; rect(2)];
          W = [W; rect(3)];
          H = [H; rect(4)];
        end
    end
    
    close all;
    if (length(X_min)>1 )
        str = strsplit(img_name, '.png');
        save(strcat(out_dir, str{1}, '.mat'), 'X_min', 'Y_min', 'W', 'H');
        X_min = [];
        Y_min = [];
        W = [];
        H = [];
    end    
end
