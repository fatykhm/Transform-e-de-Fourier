function x_inv = ifft_1d(X)
    % Nombre d'échantillons
    N = length(X);

    % Vérification de la condition d'arrêt pour la récursion
    if N <= 1
        x_inv = X;
        return;
    end

    % Division entre pair et impair (inversion)
    even = ifft_1d(X(1:2:end));
    odd = ifft_1d(X(2:2:end));

    % Facteur de rotation (inversion)
    factor = exp(2i * pi * (0:N/2-1) / N);

    % Combinaison des résultats (inversion)
    x_inv = zeros(1, N);
    x_inv(1:N/2) = even + factor .* odd;
    x_inv(N/2+1:N) = even - factor .* odd;
end