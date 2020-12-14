function [ hdr_predicted, hdr_levels] = hdr_predictor( hdr_im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[ldr_im, bins] = quantizeNL_3d(hdr_im);
hdr_predicted = zeros(size(ldr_im));
l_ch1 = ldr_im(:, :, 1);
l_ch2 = ldr_im(:, :, 2);
l_ch3 = ldr_im(:, :, 3);
ldr_levels = 0:1:255;
h_ch1 = hdr_im(:, :, 1);
h_ch2 = hdr_im(:, :, 2);
h_ch3 = hdr_im(:, :, 3);

hp_ch1 = hdr_predicted(:, :, 1);
hp_ch2 = hdr_predicted(:, :, 2);
hp_ch3 = hdr_predicted(:, :, 3);
hdr_level1 = zeros(1, length(ldr_levels)); 
hdr_level2 = zeros(1, length(ldr_levels));
hdr_level3 = zeros(1, length(ldr_levels));
for i =1:1:length(ldr_levels)
    bin_pix = h_ch1(l_ch1==ldr_levels(i));
    hdr_level1(i) = mean(bin_pix);
    hp_ch1(l_ch1==ldr_levels(i))=hdr_level1(i);
end

for i =1:1:length(ldr_levels)
    bin_pix = h_ch2(l_ch2==ldr_levels(i));
    hdr_level2(i) = mean(bin_pix);
    hp_ch2(l_ch2==ldr_levels(i))= hdr_level2(i);
end

for i =1:1:length(ldr_levels)
    bin_pix = h_ch3(l_ch3==ldr_levels(i));
    hdr_level3(i) = mean(bin_pix);
    hp_ch3(l_ch3==ldr_levels(i))=hdr_level3(i);
end
   
hdr_levels = [hdr_level1; hdr_level2; hdr_level3];
hdr_predicted(:,:,1) = hp_ch1;
hdr_predicted(:,:,2) = hp_ch2;
hdr_predicted(:,:,3) = hp_ch3;

end

