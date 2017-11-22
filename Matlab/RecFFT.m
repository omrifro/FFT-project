function [Xk] = RecFFT(Xn,Bits,prec_bits)

    N = length(Xn);
    Wn = sfi((exp(-2*pi*1i/N).^(0:N/2-1)),Bits,prec_bits);
    if (N == 1)
        Xk = Xn;
    else
        Xk_even = RecFFT(Xn(1:2:(N-1)),Bits,prec_bits);
        Xk_odd = RecFFT(Xn(2:2:N),Bits,prec_bits);
        z = sfi((Wn.*sfi(Xk_odd,Bits,prec_bits)),Bits,prec_bits);
        Xk = sfi([ Xk_even + z , Xk_even - z ],Bits,prec_bits);
        %%Xk
    end
end
    