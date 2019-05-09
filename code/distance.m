function x = distance (theta1,phi1,theta2,phi2)
  x = sqrt( 2 - 2 * ( sin(theta1).* sin(theta2).* cos(phi1-phi2) + cos(theta1).* cos(theta2) ) );
end
