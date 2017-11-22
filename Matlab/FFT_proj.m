close all;
clear all;
clc;
%%%%%%%%%%%%%%  Setting-up constants  %%%%%%%%%%%%%%%%%%%%

N = 8;
Bits = 16;
prec_bits = 12;
M = log2(N);

%%%%%%%%%%%%%%  Creating input vector  %%%%%%%%%%%%%%%%%%%

N_sized_vec = linspace(0,(N-1),N);
rand_vec = sin((2*pi*N_sized_vec)/N);  %% will be random

Xn_re =  sfi(rand_vec,Bits,prec_bits);
Xn_im = sfi(zeros(1,N),Bits,prec_bits);
Xn = Xn_re + Xn_im;

%%%%%%%%%%%%%%  Matlab FFT of the input  %%%%%%%%%%%%%%%%%

Xk_matlab = sfi(fft(rand_vec),16,12);

%%%%%%%%%%%%%% Excuting the algorithm  %%%%%%%%%%%%%%%%%%%

Xk_ours = RecFFT(Xn,Bits,prec_bits);

%%%%%%%%%%%%  Comparing the error  %%%%%%%%%%%%%%%%%%%%%%%


