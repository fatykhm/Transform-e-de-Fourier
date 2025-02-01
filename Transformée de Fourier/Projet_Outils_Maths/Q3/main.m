% Chargement d'une image
image_originale = imread('vert.jpg');

% Conversion de l'image en niveaux de gris si elle est en couleur
if size(image_originale, 3) == 3
    image = rgb2gray(image_originale);
else
    image = image_originale;
end

% Calcul de la transformée de Fourier 2D avec fft_2d
result_fft_2d = fft_2d(double(image));

% Calcul de la transformée de Fourier 2D avec fft2 de MATLAB
result_fft2 = fft2(double(image));

% Comparaison entre les deux résultats (en vérifiant l'écart absolu moyen)
mean_absolute_difference = mean(abs(result_fft_2d(:) - result_fft2(:)));

fprintf('Ecart absolu moyen entre fft_2d et fft2 : %f\n', mean_absolute_difference);

% Affichage des résultats pour comparaison visuelle
subplot(1, 3, 1);
imshow(image_originale);
title('Image originale');

subplot(1, 3, 2);
imshow(log(1 + abs(result_fft_2d)), []);
title('Transformée de Fourier avec fft_2d');

subplot(1, 3, 3);
imshow(log(1 + abs(result_fft2)), []);
title('Transformée de Fourier avec fft2');