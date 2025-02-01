function X = fft_1d(x)
    % Check the length
    N = length(x);
    if N <= 1
        X = x;
        return;
    end

    % Divide into even and odd
    even = fft_1d(x(1:2:N-1));
    odd = fft_1d(x(2:2:N));

    % Twiddle factor
    twiddle_factor = exp(-2i * pi * (0:N/2-1) / N);

    % Fuse results
    X = zeros(1, N);
    X(1:N/2) = even + twiddle_factor .* odd;
    X(N/2+1:N) = even - twiddle_factor .* odd;
end