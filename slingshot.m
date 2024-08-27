[X,Y] = meshgrid(0:500);
a=0.9; b=0.05; c = 107.8; d = 1024.3;
Z = a*atan(b*(Y-c)) + d;

%Z = exp(-Y/100);
x = 0:1/500:8;
y = 0:-1:-500;
im = imagesc(x,y,Z); hold on

%perceptive uniform colors
%m=100;
%cm_magma=magma(m);
%cm_inferno=inferno(m);
%cm_plasma=plasma(m);
%cm_viridis=viridis(m);

%custom color
g(1)= 0; g(2)= 1;
mycolormap = customcolormap(g', {'#6c86b9','#e5ffe5'});
%g(1)= 1024.3; g(2)= 2/6 - 1/6; g(3)= 3/6 - 1/6; g(4) = 4/6 - 1/6; g(5) = 5/6 - 1/6; g(6) = 6/6 - 1/6; g(7) = 1;
%mycolormap = customcolormap(g', {'#fbefcb','#f5db37','#37cae5','#0f86b6','#37cae5','#f5db37','#fbefcb'});
%mycolormap = customcolormap(g, {'#FFFFFF','#f5db37','#37cae5','#123f77','#37cae5','#f5db37','#fbefcb'}); 
%colormap(mycolormap);
%h = colorbar;

colormap(mycolormap);
ax = gca;
ax.YDir = 'normal';
hold on
h = colorbar;

tspan = [0 1];
a=0.9; b=0.05; c = 107.8; d = 1024.3; %from fitting with kilo moana density profile 
rc = 1040; rv = 1000; %cytoplasm and vacuole density
rm = 2; % ballooning radius / minimum radius -1 
dt = 0.007; %ballooning timescale
y0 = -100; %initial height

for n=1:1:8
[t,y] = ode45(@(t,y) 604800*3*((1 + 2*rm*atan(t/dt)/pi).^2 ).*(1./(1 + 2*rm*atan(t/dt)/pi).^3 + (1 + dt)*t - ((a*atan(b*(y-c)) + d - rv)/(rc-rv))), tspan, y0);
plot(t + n -1,-y*30*10^(-6) + y0,'-'); hold on
y0 = -y(length(y))*30*10^(-6) + y0;
clearvars t y;
end

y0 = -100; %another initial height
rc = 1050; %another cytoplasm density for comparison
for n=1:1:8
[t,y] = ode45(@(t,y) 604800*3*((1 + 2*rm*atan(t/dt)/pi).^2 ).*(1./(1 + 2*rm*atan(t/dt)/pi).^3 + (1 + dt)*t - ((a*atan(b*(y-c)) + d - rv)/(rc-rv))), tspan, y0);
plot(t + n-1,-y*30*10^(-6) + y0,'-'); hold on
y0 = -y(length(y))*30*10^(-6) + y0;
clearvars t y;
end

y0 = -100; %another initial height
rc = 1041.35; %another cytoplasm density for comparison
for n=1:1:8
[t,y] = ode45(@(t,y) 604800*3*((1 + 2*rm*atan(t/dt)/pi).^2 ).*(1./(1 + 2*rm*atan(t/dt)/pi).^3 + (1 + dt)*t - ((a*atan(b*(y-c)) + d - rv)/(rc-rv))), tspan, y0);
plot(t + n-1,-y*30*10^(-6) + y0,'-'); hold on
y0 = -y(length(y))*30*10^(-6) + y0;
clearvars t y;
end