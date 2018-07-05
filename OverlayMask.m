function overlayRGB = OverlayMask(rgb,binary_mask,colour,alpha)
% OverlayMask overlays a bionary mask on an rgb image 
% 
% Inputs: 
%   rgb : an rgb image
%   binary_mask : a binary mask
%   colour : a 1-by-3 vector containing overlaid color, i.e., [R,G,B]. The
%            value of R,G, and B is between 0 and 1
%   alpha : level of transparency
%
% Outputs:
%   overlayRGB : an overlaid image
%
%
% Korsuk Sirinukunwattana
% BIAlab, Department of Computer Science
% 2015-4-9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 3
    colour = [0,1,0];
    alpha = 0.8;
elseif nargin < 4
    alpha = 0.8;
end


objectMask = binary_mask;
rb_perim = bwperim(objectMask);
overlay_image = imoverlay(im2double(rgb), imdilate(rb_perim,strel('disk', 1)), colour);
% overlay_image = imoverlay(im2double(rgb), rb_perim, colour);
temp_overlay_image = im2double(overlay_image);
mask = im2double(repmat(objectMask,[1,1,3]));
mask(:,:,1) = mask(:,:,1)*colour(1);
mask(:,:,2) = mask(:,:,2)*colour(2);
mask(:,:,3) = mask(:,:,3)*colour(3);

temp_overlay_image = reshape(temp_overlay_image,[],size(temp_overlay_image,3));
mask = reshape(mask,[],size(mask,3));
temp_overlay_image(objectMask,:) = temp_overlay_image(objectMask,:)*alpha + im2double(mask(objectMask,:))*(1-alpha);
temp_overlay_image = reshape(temp_overlay_image,size(rgb,1),size(rgb,2),3);
rgb = im2uint8(temp_overlay_image);

overlayRGB = rgb;


    function out = imoverlay(in, mask, color)
        %IMOVERLAY Create a mask-based image overlay.
        %   OUT = IMOVERLAY(IN, MASK, COLOR) takes an input image, IN, and a binary
        %   image, MASK, and produces an output image whose pixels in the MASK
        %   locations have the specified COLOR.
        %
        %   IN should be a grayscale or an RGB image of class uint8, uint16, int16,
        %   logical, double, or single.  If IN is double or single, it should be in
        %   the range [0, 1].  If it is not in that range, you might want to use
        %   mat2gray to scale it into that range.
        %
        %   MASK should be a two-dimensional logical matrix.
        %
        %   COLOR should be a 1-by-3 vector of values in the range [0, 1].  [0 0 0]
        %   is black, and [1 1 1] is white.
        %
        %   OUT is a uint8 RGB image.
        %
        %   Examples
        %   --------
        %   Overlay edge detection result in green over the original image.
        %
        %       I = imread('cameraman.tif');
        %       bw = edge(I, 'canny');
        %       rgb = imoverlay(I, bw, [0 1 0]);
        %       imshow(rgb)
        %
        %   Treating the output of peaks as an image, overlay the values greater than
        %   7 in red.  The output of peaks is not in the usual grayscale image range
        %   of [0, 1], so use mat2gray to scale it.
        %
        %       I = peaks;
        %       mask = I > 7;
        %       rgb = imoverlay(mat2gray(I), mask, [1 0 0]);
        %       imshow(rgb, 'InitialMagnification', 'fit')
        
        %   Steven L. Eddins
        %   Copyright 2006-2012 The MathWorks, Inc.
        
        % If the user doesn't specify the color, use white.
        DEFAULT_COLOR = [1 1 1];
        if nargin < 3
            color = DEFAULT_COLOR;
        end
        
        % Force the 2nd input to be logical.
        mask = (mask ~= 0);
        
        % Make the uint8 the working data class.  The output is also uint8.
        in_uint8 = im2uint8(in);
        color_uint8 = im2uint8(color);
        
        % Initialize the red, green, and blue output channels.
        if ndims(in_uint8) == 2
            % Input is grayscale.  Initialize all output channels the same.
            out_red   = in_uint8;
            out_green = in_uint8;
            out_blue  = in_uint8;
        else
            % Input is RGB truecolor.
            out_red   = in_uint8(:,:,1);
            out_green = in_uint8(:,:,2);
            out_blue  = in_uint8(:,:,3);
        end
        
        % Replace output channel values in the mask locations with the appropriate
        % color value.
        out_red(mask)   = color_uint8(1);
        out_green(mask) = color_uint8(2);
        out_blue(mask)  = color_uint8(3);
        
        % Form an RGB truecolor image by concatenating the channel matrices along
        % the third dimension.
        out = cat(3, out_red, out_green, out_blue);
    end


end