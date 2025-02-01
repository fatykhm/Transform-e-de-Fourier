% Chargement d'une image
image_originale = imread('vert.jpg');

% Conversion de l'image en niveaux de gris si elle est en couleur
if size(image_originale, 3) == 3
    image = rgb2gray(image_originale);
else
    image = image_originale;
end

% Calcul de la transformée de Fourier 2D avec fft_2d 
% (fonction personnalisée)
X = fft_2d(double(image));

% Calcul de la transformée de Fourier inverse 2D avec ifft_2d
image_inverse = ifft_2d(X);

% Affichage de l'image originale et de l'image inversée
subplot(1, 2, 1);
imshow(image, []);
title('Image originale');

subplot(1, 2, 2);
imshow(real(image_inverse), []);
title('Image après transformée inverse');