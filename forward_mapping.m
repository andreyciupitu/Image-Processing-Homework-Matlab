% Functie ce aplica o transformare T asupra unei imagini
% T -> matricea de transformare
% img_in -> matricea imaginii
% img_out ->matricea noii imagini
function img_out = forward_mapping(img_in, T)
	[n m] = size(img_in);
  
  % Determina dimensiunile noii imagini
	aux = [T * [1; 1], T * [1;m], T * [n;1], T * [n;m]];
	dim_min = min(aux, [], 2);
	dim_max = max(aux, [], 2);
	new_dim = round(dim_max - dim_min) + 1;
	img_out = zeros(new_dim(1), new_dim(2));
  
  % Determina cu cat trebuie shiftate noile coordonate
  offset = round([1 1] - dim_min);
  
  % Aplica transformarea T asupra imaginii
	for i = 1 : n
		for j = 1 : m
			x = round(T(1, 1) * i + T(1, 2) * j) + offset(1);
			y = round(T(2, 1) * i + T(2, 2) * j) + offset(2);
			img_out(x, y) = img_in(i, j);
		end
	end
end
