clc
clear

A = xlsread('loc.xlsx');
theta=[];
phi=[];
for i=1:29
    theta(:,i)=A(:,2*i-1);
    phi(:,i)=A(:,2*i);
end

for N=2:30
    the1=theta(:,N-1);
    the2=the1(1:N);
    phi1=phi(:,N-1);
    phi2=phi1(1:N);
    a(1,N-1)=energy(the2,phi2);
    a(2,N-1)=energy1(the2,phi2);
end
b=[0.5,1.732050808,3.674234614,6.474691495,9.985281374,14.452977414,19.675287861,25.759986531,32.716949460,40.596450510,49.16525305,58.853230612,69.306363297,80.670244114,92.911655302,106.050404829,120.084467447,135.089467557,150.881568334,167.641622399,185.287536149,203.930190663,223.347074052,243.812760299,265.133326317,287.302615033,310.491542358,334.634439920,359.603945904]
x=linspace(2,30,29);
% plot(x,b,'r-*')
% hold on
plot(x,a(1,:),'b-o')
%legend('Coulomb case','Energy from logarithm configuration')
legend('Logarithm case')
xlabel('N')
ylabel('Energy')
title('Energy of logartithm case at N')