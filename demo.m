% Functie demo pentru metoda inverse_mapping
function demo()
  
  % Citeste matricile imaginilor
  img_in1 = imread('flapping_bird.png');
  img_in2 = imread('flapping_duck.png');
  
  % Rotatie fata de orizontala
  T = [-1 0; 0 -1];
  imwrite(mat2gray(inverse_mapping(img_in1, T)), 'flapping_bird_hflip.png');
  imwrite(mat2gray(inverse_mapping(img_in2, T)), 'flapping_duck_hflip.png');
  
  % Scalare cu 0.4
  T = [0.4 0; 0 0.4];
  imwrite(mat2gray(inverse_mapping(img_in1, T)), 'flapping_bird_downscale.png');
  imwrite(mat2gray(inverse_mapping(img_in2, T)), 'flapping_duck_downscale.png');
  
  % Rotatie cu 45 de grade
  T = [cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)];
  imwrite(mat2gray(inverse_mapping(img_in1, T)), 'flapping_bird_rotate.png');
  imwrite(mat2gray(inverse_mapping(img_in2, T)), 'flapping_duck_rotate.png');
  
  % Forward-Mapping
  imwrite(mat2gray(forward_mapping(img_in2, T)), 'demo_forward_mapping.png');
  
  % Transform_image cu un factor de 2.8
  imwrite(mat2gray(transform_image(img_in1, 2.8)), 'demo_transform_image.png');
end