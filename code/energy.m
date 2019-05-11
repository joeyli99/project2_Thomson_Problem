function total = energy(theta , phi)
  total = 0;
  N = length(theta);
  for i=1:N
    the_self = theta(i);
    phi_self = phi(i);
    the_other = theta;
    the_other(i) = [];
    phi_other = phi;
    phi_other(i) = [];
    total = total + sum(-log(distance(the_self, phi_self, the_other, phi_other)) );
  end
  total = total / 2;
end
