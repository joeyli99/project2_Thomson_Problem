clc
clear all
close all

A = xlsread('loc.xlsx');
theta=[];
phi=[];
for i=1:29
    theta(:,i)=A(:,2*i-1);
    phi(:,i)=A(:,2*i);
end

N=30;             %输出电荷数为N下的configuration
the1=theta(:,N-1);
the2=the1(1:N);
phi1=phi(:,N-1);
phi2=phi1(1:N);



a = the2;
b = phi2;
x0=sin(a).*cos(b);
y0=sin(a).*sin(b);
z0=cos(a);

t=linspace(0,pi,25);
p=linspace(0,2*pi,25);
[theta,phi]=meshgrid(t,p);
x=sin(theta).*sin(phi);
y=sin(theta).*cos(phi);
z=cos(theta);
surf(x,y,z);
shading interp
set(gca,'ZLim',[-100 100])
axis equal
alpha(0.4)
hold on 
scatter3(x0,y0,z0,s,'filled')
view(45,30)
