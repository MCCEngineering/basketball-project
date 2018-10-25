clc,clear

% user input a velocity
% user input an angle

velocity = 30;
angle = 25; % in degrees

% shoot the ball from above the origin toward a non-existent target
time = 0:.01:1000000;
%x = x0 + v0x t + 1/2 ax t^2
x = 0 + velocity * cosd(angle) * time + 1/2 * 0 * time.^2;
% y = y0 + v0y t + 1/2 ay t^2
y = 0 + velocity * sind(angle) * time + 1/2 * (-9.81) * time.^2;
goodvalues = find(y>=0);
goodys = y(goodvalues);
goodxs = x(goodvalues);
plot(goodxs,goodys)