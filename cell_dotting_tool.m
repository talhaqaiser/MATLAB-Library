%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Talha Qaiser
% Department of Computer Science, 
% University of Warwick, UK.
% http://www2.warwick.ac.uk/fac/sci/dcs/people/research/talhaqaiser
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear 
close all

dir_path = 'C:\fakepath\';
dir_list =  dir([dir_path '*.png']);
out_dir = 'cell_dotting\GT\';

accum = 895;
X = []; Y = [];
for i=273:2:length(dir_list)
    i
    img_name = dir_list(i).name;
    img_name =  'LC200 350  351_A1MI_1.jp2_59.png'
    img_path = strcat(dir_path, img_name);
    
    img = imread(img_path);
    figure,imshow(img)
           
    set(gcf,'CurrentCharacter','@');
    while true
        k=get(gcf,'CurrentCharacter');
        if k=='q'
            if (length(X) == 1)
               X = []; 
               Y = [];
            end
            break;
        else
          [x,y] = ginput(1);
          hold on; % Prevent image from being blown away.
          plot(x,y,'r+', 'MarkerSize', 5);
          X = [X; x];
          Y = [Y; y];
        end
    end
    
    close all;
    if (length(X)>1 )
        str = strsplit(img_name, '.png');
        save(strcat(out_dir, str{1}, '.mat'), 'X', 'Y');
        accum = accum +  length(X) 
        X = [];
        Y = [];
    end

    
end
