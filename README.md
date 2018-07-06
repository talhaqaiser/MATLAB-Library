# My-Library
General purpose customized MATLAB functions 

## List of functions 
 - __tool_for_cell_boxes:__ Tool for preparing ground-truth for object detection (faster R-CNN). 
 Draw rectangle boxes around objects. All the rect coordinates stores in a .mat file. 
 I have only tested it for annotating nuclei (small rectangle boxes).  
 
 - __cell_dotting_tool:__ Annotate nuclei center (ground-truth) for objection detection model.
  For each visual field (image), it stores a separate .mat file containing all the nuclei coordinates. 
  
 - __pca_analysis:__ Extract principle components from given data and reconstruct back form PCA. 
 
 - __overlay_mask:__ Overaly bianary mask on a RGB image. 
 
 - __countCSVlines:__ Count number of lines in a CSV file.
 
 - __quantile2d:__ Computer quartile of a 2D matrix.
