clear all
close all
clc

%________________________________DECODER___________________________________
%----------------decode BL and EL from JPEG--------------------------------

file_name = 'memorial_o876.hdr';
fn_BL = 'C:\Users\ayesha.babar\Desktop\project_results\encoder\BL\im1.png';
fn_EL = 'C:\Users\ayesha.babar\Desktop\project_results\encoder\EL\im1.png';
BL = imread(fn_BL);
EL = imread(fn_EL);
%--------------------------inverse mapping---------------------------------
bl_recovered = hdr_decoder(BL, strcat('parameters_',file_name(1:end-5),'_bl.mat'));
el_recovered = hdr_decoder(EL, strcat('parameters_',file_name(1:end-5),'_el.mat'));

%--------add inverse mapped layers to recover HDR image-------------------
final_image = bl_recovered + el_recovered;
figure
imshow(single(final_image))
title('final recovered image');

figure
imshow(single(bl_recovered))
title('bl recovered hdr image');

figure
imshow(single(el_recovered))
title('el recovered hdr image');
%---------------------------calculate MSE----------------------------------
im_in = hdrread(file_name);

diff_sq = (im_in - final_image).^2;

diff_sq = reshape(diff_sq, 1, numel(diff_sq));

mse = sum(diff_sq);