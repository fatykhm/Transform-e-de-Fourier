% Paramètres du signal
fs = 1000;            % Fréquence d'échantillonnage en Hz
t = 0:1/fs:1-1/fs;     % Vecteur de temps d'une seconde

% Générer un signal composé de deux fréquences
f1 = 50;              % Fréquence en Hz
f2 = 150;             % Fréquence en Hz
signal = cos(2*pi*f1*t) + 0.5*cos(2*pi*f2*t);

% Calculer la FFT avec la fonction fft
fft_result_builtin = fft(signal);

% Calculer la FFT avec la fonction fft_1d
fft_result_custom = fft_1d(signal);

% Comparer les résultats
figure;

subplot(3, 1, 1);
plot(t, signal);
title('Signal dans le domaine temporel');

subplot(3, 1, 2);
plot(abs(fft_result_builtin));
title('FFT avec la fonction fft');

subplot(3, 1, 3);
plot(abs(fft_result_custom));
title('FFT avec la fonction fft_1d');

% Vérifier si les résultats sont proches
max_error = max(abs(fft_result_builtin - fft_result_custom));
disp(['Erreur maximale entre fft et fft_1d : ', num2str(max_error)]);