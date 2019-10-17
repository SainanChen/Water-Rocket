function g=eqnscoupled(t,z)

Mw=z(1);     	
Vx=z(2);
Vy=z(3);
x=z(4);
y=z(5);

%air friction
d=0.11;           %                                       
Af=0.25*pi*d^2;   %rocket frontal area
Cd=0.8;           %drag coefficient                        test run 
roAir=1;          %density of air, aka ro_inifinity
V=(Vx^2+Vy^2)^0.5;%velocity
Fd=Cd*Af*roAir*V*V*0.5;

%mass discharge rate
Aj=0.000452;      %nozzle flow area                       
Cn=0.8;           %nozzle discharge coefficient            test run
roW=1000;         %water density
Vt=0.002;         %total bottle volume                     
Va0=0.0015;        %initial air volume                      test run
Va=Vt-Mw/roW;     %air volume
Pa0=344830;      %initial air pressure                    test run
Pa=Pa0*(Va0/Va)^1.4;%air pressure in bottle
Pair=101325;      %ambient pressure aka P_infinity
if Mw > 0
    Mj=Cn*Aj*(2*roW*(Pa-Pair))^0.5;
else
    Mj=0;
end
Vj=Mj/(Aj*roW);   %jet velocity relative to bottle

%gravitational force
Ms=0.180;             %bottle mass                        
Fg=9.81*(Mw+Ms);

%theta
costheta=Vx/V;
sintheta=Vy/V;

%differential equation
dMwdt=-Mj;
dVxdt=(-Fd*costheta+Mj*Vj*costheta)/(Mw+Ms);
dVydt=(-Fg-Fd*sintheta+Mj*Vj*sintheta)/(Mw+Ms);
dxdt=Vx;
dydt=Vy;

% Output column vector for MATLAB syntax
g=[dMwdt dVxdt dVydt dxdt dydt]';	

