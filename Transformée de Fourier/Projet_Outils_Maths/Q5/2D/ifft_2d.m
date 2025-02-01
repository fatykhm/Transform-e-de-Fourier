function image_inv = ifft_2d(X)
    % Taille de l'image
    [M, N] = size(X);

    % Calcul de la TFI pour les lignes
    rows_inv = zeros(M, N);
    for i = 1:M
        rows_inv(i, :) = ifft_1d(X(i, :));
    end

    % Calcul de la TFI pour les colonnes
    image_inv = zeros(M, N);
    for j = 1:N
        image_inv(:, j) = ifft_1d(rows_inv(:, j).').'; % Transposée pour aligner les colonnes
    end
end