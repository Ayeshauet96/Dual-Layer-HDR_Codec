clear all
close all
clc

%_________________________ENCODER__________________________________________

%------------------------read input image--------------------------------
files = 'memorial_o876.hdr'; %any input file in given dataset.
im_in = hdrread(files);
im_cm = rgb2ycbcr(double(im_in));
figure
imshow(im_in)
title('original HDR image')
%-----------------quantize the rgb channels--------------------------------
[im_out, levels] = quantizeNL_3d(im_in);
figure
imshow(uint8(im_out))
title('LDR image of BL')

%-----------------encode base layer----------------------------------------
fn_BL = 'C:\Users\ayesha.babar\Desktop\project_results\encoder\BL\im1.png';
imwrite(uint8(im_out), fn_BL) 

%-----------------predict hdr image fron BL--------------------------------
[im_predicted, hdr_levels] = hdr_predictor(im_in);
figure
imshow(im_predicted)
title('predicted HDR image BL')

%--------------------enhancement layer-------------------------------------
enhancement_layer = im_in - im_predicted;
[el_out, ~] = quantizeNL_3d(enhancement_layer);
figure
imshow(uint8(el_out))
title('enhancement layer')
%-----------------encode the enhancement layer-----------------------------
fn_EL = 'C:\Users\ayesha.babar\Desktop\project_results\encoder\EL\im1.png';
imwrite(uint8(el_out), fn_EL)
%------------------parameters for EL--------------------------------------
[im_p_el, hdr_levels_el] = hdr_predictor(enhancement_layer);
%---------------------store hdr predictor parameters----------------------
save(strcat('parameters_',files(1:end-5),'_bl.mat'), 'hdr_levels');
hdr_levels = hdr_levels_el;
save(strcat('parameters_',files(1:end-5),'_el.mat'), 'hdr_levels');
