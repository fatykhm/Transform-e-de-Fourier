function result = fourierDiscrete(image)
    %Conversion en double (pour eviter pb de traitement des complexes)
    image = double(image);
    %image en niveaux de gris
    if size(image,3) == 3
        image = rgb2gray(image);
    end
    %Taille
    [M,N] = size(image);
    %Matrice pour transformée
    result = zeros(M,N);
    %Calcul de la transformée
    for u = 1:M
        for v = 1:N
            somme=0;
            for x = 1:M
                for y = 1:N
                    somme = somme + image(x,y)*(exp(-1*i*2*pi*((u-1)*(x-1)/M + (v-1)*(y-1)/N)));
                end
            end
            result(u,v) = somme;
        end
    end
end

