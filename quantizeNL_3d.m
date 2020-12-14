function [ im_out, bins ] = quantizeNL_3d( im_in )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

ch1 = im_in(:,:,1);
ch2 = im_in(:,:,2);
ch3 = im_in(:,:,3);
[e1, er1, lb1] = quantizeNL_new(ch1, 255);
[e2, er2, lb2] = quantizeNL_new(ch2, 255);
[e3, er3, lb3] = quantizeNL_new(ch3, 255);
s_im = size(im_in);
ch_out1 = reshape(lb1, s_im(1), s_im(2));
ch_out2 = reshape(lb2, s_im(1), s_im(2));
ch_out3 = reshape(lb3, s_im(1), s_im(2));
im_out = zeros(s_im(1), s_im(2), 3);
im_out(:, :, 1) = ch_out1;
im_out(:, :, 2) = ch_out2;
im_out(:, :, 3) = ch_out3;

bins = [e1; e2; e3];
end

