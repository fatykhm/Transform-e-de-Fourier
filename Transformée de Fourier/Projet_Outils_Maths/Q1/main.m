% Chargement d'une image
image_originale = imread('vert.jpg'); 

% Conversion de l'image en niveaux de gris si elle est en couleur
if size(image_originale, 3) == 3
    image = rgb2gray(image_originale);
else
    image = image_originale;
end

% Calcul de la transformée de Fourier à l'aide de fourierDiscrete
result_discrete = fourierDiscrete(image);

% Calcul de la transformée de Fourier à l'aide de fft2 de MATLAB
result_fft2 = fft2(double(image));

% Comparaison entre les deux résultats (en vérifiant l'écart absolu moyen)
mean_absolute_difference = mean(abs(result_discrete(:) - result_fft2(:)));

fprintf('Ecart absolu moyen entre fourierDiscrete et fft2 : %f\n', mean_absolute_difference);

% Affichage des résultats pour comparaison visuelle
subplot(2, 2, 1);
imshow(image_originale);
title('Image originale');

subplot(2, 2, 2);
imshow(log(1 + abs(result_discrete)), []);
title('Transformée de Fourier avec fourierDiscrete');

subplot(2, 2, 3);
imshow(log(1 + abs(result_fft2)), []);
title('Transformée de Fourier avec fft2');

subplot(2, 2, 4);
imshow(log(1 + abs(result_discrete - result_fft2)), []);
title('Différence entre les résultats');