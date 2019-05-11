clc;
clear;
N = 30; %number of charges.
ensemble_size = 100; %The members in population.
max_generation = 10000; %The max generation
mutation = 15; %mutation members.

energy_gene=zeros(1,max_generation);
map_ensemble = zeros(N, 2, ensemble_size);
for i = 1:ensemble_size
  map_ensemble(:, :, i) = rand_map(N);
end
generation = 0;
while (generation < max_generation)
  energy_ensem = zeros(ensemble_size, 1);
  for i = 1 : ensemble_size
    energy_ensem(i) = energy(map_ensemble(:, 1, i), map_ensemble(:, 2, i));
  end
  [s, index] = sort(energy_ensem);
  energy_gene(generation+1)=s(1);
  disp([num2str(s(1)),' ', num2str(generation)])
  next_generation = zeros(N, 2, ensemble_size);
  next_generation(:, :, 1:5) = map_ensemble(:, :, index(1:5)); %The best 5 join to the next generation a superparameter
  %index(end-4 : end) = []; %The worst 5 die.
  %s(end-4 : end)= [];
  
  s = exp(-s)/(1+exp(-s)); %An active function which is obtained by incident.
  s = s/sum(s); % we try to interpret the energy into the probability.
  for i = 1:ensemble_size
    f_prob = rand();
    m_prob = rand();
    prob_sum = 0;
    father = 0;
    mother = 0;
    for j = 1:ensemble_size
      prob_sum = prob_sum+s(j); %The Roulette method.
      if (prob_sum>f_prob)
        father = j;
        break;
      end
    end
    prob_sum = 0;
    for j = 1:ensemble_size
      prob_sum = prob_sum+s(j);
      if (prob_sum>m_prob)
        mother = j;
        break;
      end
    end
    next_generation(:, :, i+5) = (map_ensemble(:, :, index(father)) + map_ensemble(:, :, index(mother)))./2; %The son is the average of the parents.
  end
  %next_generation(:,:,ensemble_size) = rand_map(N); %move in 
  
  for i = 1:mutation
    choose = randi(ensemble_size-5)+5; %The one who is choosed as mutation.
    site = randi(N); %The mutation site.
    next_generation(site, :, choose) = next_generation(site, :, choose)+ (rand(1, 2)-0.5)*pi/3;
  end
  
  map_ensemble = next_generation; %update the ensemble.
  generation = generation + 1; %update the generation.
end
%plot(1:max_generation, energy_gene)
%disp(energy_ensem(1))