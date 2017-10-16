% Functie ce calculeaza intensitatea imaginii img
% in pozitia (row, col) folosind interpolarea biliniara
function value = bilerp(img, row, col)
	[n m] = size(img);
	value = 0;
	if ((col >= 1) && (col < m))
    
    % Interpoleaza dupa directia x
    j = floor(col);
    aux1 = lerp(img(:, j), row);
		aux2 = lerp(img(:, j+1), row);
    
    % Interpoleaza dupa directia y
		a = aux2 - aux1;
    b = aux1 - a * j;
		value = a * col + b;
	end
  if (col == m)
    value = lerp(img(:, m), row);
  end
end
