function X = fft_1d(x)
    % Nombre d'échantillons
    N = length(x);
    % Vérification de la condition d'arrêt pour la récursion
    if N <= 1
        X = x;
        return;
    end
    % Division entre pair et impair
    even = fft_1d(x(1:2:N-1));
    odd = fft_1d(x(2:2:N));
    % Facteur de rotation (racine n-ieme de l'unite)
    factor = exp(-2i * pi * (0:N/2-1) / N);
    % Combinaison des resultats
    X = zeros(1, N);
    X(1:N/2) = even + factor .* odd;
    X(N/2+1:N) = even - factor .* odd;
end