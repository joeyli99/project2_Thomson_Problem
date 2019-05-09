N = 4;
kb = 0.01;
map = rand_map(N);
map_try = zeros(N, 2);
energy_now = energy(map(:, 1), map(:, 2));
for t = 500:-1:1
  for epochs = 1:200
    counter = 0;
    map_try(2:N, :) = map(2:N, :)+(rand(N-1, 2)-0.5)*pi/3;
    energy_try = energy(map_try(:, 1), map_try(:, 2));
    counter = counter +1;
    if (energy_try < energy_now)
      map = map_try;
      energy_now = energy_try;
    else
      prob = exp(-(energy_try-energy_now)/kb/t);
      if (rand() < prob)
        map = map_try;
        energy_now = energy_try;
      end
    end
  end
  disp(energy_now)
end
  map = spheical_norm(map);
