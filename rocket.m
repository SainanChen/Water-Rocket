to=0;
tmax=5;

Mw0=0.5;     %plug in
V0=10;       %change according to final run
theta=1;     %change according to final run?57.3
Vx0=V0*cos(theta);
Vy0=V0*sin(theta);
x0=0;
y0=0;

zo=[Mw0 Vx0 Vy0 x0 y0]; 

[t,z]=ode45('rocketeqns',[to,tmax],zo);	%calling statement for ode solver

%This section does all of the plotting
figure(1)	
%hold on
plot(z(:,4),z(:,5),'r-');
xlabel('x');
ylabel('y');

