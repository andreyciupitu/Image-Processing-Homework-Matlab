% Functie ce realizeaza o interpolare liniara
function value = lerp(v, x)
  value = 0;
	n = length(v);
	if ((x >= 1) && (x < n))
		i = floor(x);
		a = v(i+1) - v(i);
		b = v(i) - a * i;
		value = a * x + b;
	end
  if (x == n)
    value = v(n);
  end
end
