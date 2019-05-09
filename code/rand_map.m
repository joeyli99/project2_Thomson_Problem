function map = rand_map(N)
  map = zeros(N, 2);
  map(2:N, 1) = rand(N-1, 1)*pi; %theta;
  map(2:N, 2) = rand(N-1, 1)*2*pi; %phi;
end
