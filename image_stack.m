% Functie ce creeaza un stack de imagini blurred
% plecand de la imaginea initiala
% img -> matricea imaginii
% num_levels -> numarul de nivele din stack
% stack -> image stack-ul rezultat
function stack = image_stack(img, num_levels)
  [n m] = size(img);
  
  % Initializeaza stack-ul de imagini
  stack = zeros(n, m, num_levels);
  stack(:, :, 1) = img;
  
  % Matricea de blur
  K = 1/9 .* ones(3);
  
  % Obtne fiecare nivel din stack folosind
  % matricea de blur
  for i = 2 : num_levels
    stack(:, :, i) = conv2(stack(:, :, i-1), K, 'same');
  end  
end
