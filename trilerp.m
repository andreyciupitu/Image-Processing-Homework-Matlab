% Functie ce calculeaza intensitatea imaginii img
% in pozitia (row, col, level) folosind interpolarea triliniara
function value = trilerp(stack, row, col, level)
  [n m p] = size(stack);
	value = 0;
	if ((level >= 1) && (level < p))
    
    % Interpolare biliniara dupa x si y
    k = floor(level);
    aux1 = bilerp(stack(:, :, k), row, col);
    aux2 = bilerp(stack(:, :, k+1), row, col);
    
    % Interpolare dupa z
    a = aux2 - aux1;
    b = aux1 - a * k;
    value = a * level + b;
	end
  if (level == p)
    value = bilerp(img(:, :, p), row, col);
  end
end
