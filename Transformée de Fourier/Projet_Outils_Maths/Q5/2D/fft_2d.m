function X = fft_2d(image)
    % Taille de l'image
    [M, N] = size(image);
    
    % Calcul de la FFT pour les lignes
    X_rows = zeros(M, N);
    for i = 1:M
        X_rows(i, :) = fft_1d(image(i, :));
    end
    
    % Calcul de la FFT pour les colonnes
    X = zeros(M, N);
    for j = 1:N
        X(:, j) = fft_1d(X_rows(:, j).').'; % Transposée pour aligner les colonnes
    end
end