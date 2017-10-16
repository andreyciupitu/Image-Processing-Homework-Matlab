% Functie ce aplica o transformare T asupra unei imagini
% folosind metoda inverse-mapping
% T -> matricea de transformare
% img_in -> matricea imaginii
% img_out ->matricea noii imagini
function img_out = inverse_mapping(img_in, T)
	[n m] = size(img_in);
  
  % Determina transformarea inversa
  det_T = T(1, 1) * T(2, 2) - T(1, 2) * T(2, 1);
  T_inv = 1/det_T .* [T(2, 2), -T(1, 2); -T(2, 1), T(1, 1)];
  
  % Determina dimensiunile noii imagini
	aux = [T * [1; 1], T * [1;m], T * [n;1], T * [n;m]];
	dim_min = min(aux, [], 2);
	dim_max = max(aux, [], 2);
	new_dim = round(dim_max - dim_min) + 1;
	img_out = zeros(new_dim(1), new_dim(2));
  
  % Determina cu cat trebuie shiftate noile coordonate
  offset = round([1 1] - dim_min);
  
  % Aplica transformarea T_inv asupra coordonatelor
  % imaginii rezultante
	for i = 1 : new_dim(1)
		for j = 1 : new_dim(2)
			x = T_inv(1, 1) * (i-offset(1)) + T_inv(1, 2) * (j-offset(2));
			y = T_inv(2, 1) * (i-offset(1)) + T_inv(2, 2) * (j-offset(2));
      
      % Detrmina intensitatea pixelului folosind
      % interpolarea biliniara
			img_out(i, j) = bilerp(double(img_in), x, y);
		end
	end
end
