clc;
clear;
N = 30;
ensemble_size = 1000;
max_generation = 10000;
mutation = 200;
load('map_ensemble.mat','map_ensemble')

generation = 0;
while (generation < max_generation)
  energy_ensem = zeros(ensemble_size, 1);
  for i = 1 : ensemble_size
    energy_ensem(i) = energy(map_ensemble(:, 1, i), map_ensemble(:, 2, i));
  end
  
  [s, index] = sort(energy_ensem);
  disp([num2str(s(1)), num2str(generation)])
  next_generation = zeros(N, 2, ensemble_size);
  next_generation(:, :, 1) = map_ensemble(:, :, index(1));%继承最好的1个个体
  index(end-9 : end) = [];%淘汰最差的10个个体。
  s(end-9 : end)= [];
  s = exp(-s)/(1+exp(-s));%玄学函数，用于对能量进行排列，把小的变大，大的变小，可能还可以优化
  s = s/sum(s);
  
  for i = 1:(ensemble_size-1)
    f_prob = rand();
    m_prob = rand();
    prob_sum = 0;
    father = 0;
    mother = 0;
    for j = 1:(ensemble_size-10)
      prob_sum = prob_sum+s(j); %约优秀的个体越容易被选为父母遗传下去。
      if (prob_sum>f_prob)
        father = j;
        break;
      end
    end
    prob_sum = 0;
    for j = 1:(ensemble_size-10)
      prob_sum = prob_sum+s(j);
      if (prob_sum>m_prob)
        mother = j;
        break;
      end
    end
    next_generation(:, :, i+1) = (map_ensemble(:, :, index(father)) + map_ensemble(:, :, index(mother)))./2;%子代为父母的平均值，还可以优化。
  end
  
  for i = 1:mutation
    choose = randi(ensemble_size-1)+1; %保护第一个
    for j = 1:2
        site = randi(30);
        next_generation(site, :, choose) = next_generation(site, :, choose)+ (rand(1, 2)-0.5)*pi/3;
    end
  end
  
  map_ensemble = next_generation; %一代遗传结束
  generation = generation + 1;
end
