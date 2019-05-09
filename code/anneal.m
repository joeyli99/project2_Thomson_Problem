N = 3;
kb = 0.001;
map = rand_map(N);
energy_now = energy(map(:, 1), map(:, 2));
for t = 300:-1:1
  for epochs = 1:200
    map_try = map+(rand(N,2)-0.5)*pi/5;
    map_try(:, 1) = mod( map_try(:, 1), pi);
    map_try(:, 2) = mod( map_try(:, 1), 2 * pi);
    energy_try = energy(map_try(:, 1), map_try(:, 2));
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
