clc;
clear;
N = 30;
kb = 10;
map = rand_map(N);
map_try = zeros(N, 2);
energy_now = energy(map(:, 1), map(:, 2));
for t = 0.5:-0.001:0.005
  for epochs = 1:10000
    map_try(2:N, :) = map(2:N, :)+(rand(N-1, 2)-0.5)*pi/3;
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


for t = 0.005:-0.00001:0.00005
  for epochs = 1:10000
    map_try(2:N, :) = map(2:N, :)+(rand(N-1, 2)-0.5)*pi/3;
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

for t = 0.00005:-0.0000001:0.0000001
  for epochs = 1:10000
    map_try(2:N, :) = map(2:N, :)+(rand(N-1, 2)-0.5)*t*pi/3;
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
map = spheical_norm(map);
disp(map)