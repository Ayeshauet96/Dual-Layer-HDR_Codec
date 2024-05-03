function [ hdr_im ] = hdr_decoder( ldr_im, parameters)
par = load(parameters);
hdr_levels = par.hdr_levels;
hdr_level1 = hdr_levels(1,:);
hdr_level2 = hdr_levels(2,:);
hdr_level3 = hdr_levels(3,:);

hdr_im = zeros(size(ldr_im));
l_ch1 = ldr_im(:, :, 1);
l_ch2 = ldr_im(:, :, 2);
l_ch3 = ldr_im(:, :, 3);

ldr_levels = 0:1:255;

hp_ch1 = hdr_im(:, :, 1);
hp_ch2 = hdr_im(:, :, 2);
hp_ch3 = hdr_im(:, :, 3);

for i =1:1:length(ldr_levels)
    hp_ch1(l_ch1==ldr_levels(i))=hdr_level1(i);
end

for i =1:1:length(ldr_levels)
    hp_ch2(l_ch2==ldr_levels(i))= hdr_level2(i);
end

for i =1:1:length(ldr_levels)
    hp_ch3(l_ch3==ldr_levels(i))=hdr_level3(i);
end
   
hdr_im(:,:,1) = hp_ch1;
hdr_im(:,:,2) = hp_ch2;
hdr_im(:,:,3) = hp_ch3;


end

