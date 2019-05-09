function normal = spheical_norm(map)
  normal = zeros(size(map, 1), 2);
  the = map(:, 1);
  phi = map(:, 2);
  normal(:, 1) = acos(cos(the));
  normal(:, 2) = mod( atan2(sin(the).*sin(phi), sin(the).*cos(phi)), 2*pi ); %ะþัง
end
