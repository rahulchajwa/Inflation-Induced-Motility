[X,Y] = meshgrid(0:500);
Z = exp(-Y/100);
x = 0:1/500:1;
y = 0:-1:-500;
%im = imagesc(x,y,Z); hold on
%ax = gca;
%ax.YDir = 'normal'
hold on

tspan = [0 1];
a=0.9; b=0.05; c = 107.8; d = 1024.3;
%rc = 1040; 
rv = 1010; %vacuole density
dt =  0.00099206; %ballooning time/cell cycle time
y0 = -150; %initial height
k = 1;
for rc=1011:0.1:1200
%for n=1:1:8
for rm = 1:0.01:10 %ballooning radius/minimum radius -1
[t,y] = ode45(@(t,y) 604800*3*((1 + 2*(rm-1)*atan(t/dt)/pi).^2 ).*(1./(1 + 2*(rm-1)*atan(t/dt)/pi).^3 + (1 - 1./rm.^3)*t - ((a*atan(b*(y-c)) + d - rv)/(rc-rv))), tspan, y0);

if -y(length(y))*30*10^(-6) + y0 > y0 %condition for measuring the critical ballooning radius
    R(k,1) = rc; R(k,2) = rm;
    %plot(t,-y*30*10^(-6) + y0,'-'); hold on
    %rc
    %rm
    k = k+1;
    break
end
clearvars t y;
end
%k = k + 1;

end


plot(R(:,1),R(:,2),'-'); 
