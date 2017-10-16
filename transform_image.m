% Functie ce realizeaza un downsample cu un factor k
% img_in -> matricea imaginii
% k -> factorul de downsample
% img_out -> matricea noii imagini
function img_out = transform_image(img_in, k)
    [n m] = size(img_in);
    l = floor(k);
    
    % Obtine un image stack pornind de la
    % imaginea initiala
    stack = image_stack(img_in, l+1);
    
    % Determina noua imagine folosind interpolarea triliniara
    for i = 1 : n
      for j = 1 : m
        img_out(i, j) = trilerp(stack, i, j, k);
      end
    end
end