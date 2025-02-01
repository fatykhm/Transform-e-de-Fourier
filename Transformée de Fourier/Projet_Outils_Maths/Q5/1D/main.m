% Génération un signal à transformer
signal = randn(1, 16); 

% Calcul de la transformée de Fourier 1D avec votre fonction
X = fft(signal);

% Calcul de la transformée de Fourier inverse 1D avec votre fonction
% ifft_1d (avec un facteur 16)
signal_inverse = ifft_1d(X);

% Calcul de la transformée de Fourier inverse 1D avec ifft de MATLAB
signal_matlab_inverse = ifft(X);

% Comparaison entre les deux résultats (en vérifiant l'écart absolu moyen)
mean_absolute_difference = mean(abs(signal_inverse - signal_matlab_inverse));

fprintf('Ecart absolu moyen entre ifft_1d et ifft de MATLAB (facteur x16 à prendre en compte : %f\n', mean_absolute_difference);

% Affichage des signaux avant et après l'inversement
subplot(2, 1, 1);
stem(signal);
title('Signal original');
xlabel('Echantillons');
ylabel('Amplitude');

subplot(2, 1, 2);
stem(real(signal_inverse)); % Affichage de la partie réelle du signal inversé
title('Signal après transformation inverse');
xlabel('Echantillons');
ylabel('Amplitude');