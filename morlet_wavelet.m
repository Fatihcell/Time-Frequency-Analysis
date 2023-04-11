function morlet = morlet_wavelet(freq,fs)
%% Description
% The morlet wavelet kernel with specified frequency 'freq' and sampling
% frequency 'fs'
% Author: Fatih ONAY
%%  Morlet Wavelet
% Parameters
t = -1 : 1/fs :  1; % The length of kernel in time 
fwhm = .5;  % Full width at half maximum

% The sinusoidal part of wavelet
sinusoidal = exp(1i*2*pi*freq*t); 

% The gaussian part of wavelet
gaussian = exp(-4*log(2)*t.^2 / (fwhm^2) );

% Morlet wavelet
morlet = sinusoidal.*gaussian;
end