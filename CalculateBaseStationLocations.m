function [ baseStationLocations ] = CalculateBaseStationLocations( cellRange, NumberOfbaseStationRings, rotationAngle, xDisplacement, yDisplacement, debug )
%   calculates the coordinates of a hexagonal base station network
 
% range : sector range, km
%    note that the inter-side distance is 3*range/2

% Nring: number of 'hex rings'
% 0 rings means 1 base station / 1 ring means 6 + 1 base stations / 2 rings
% means 12 + 6 + 1 base stations / etc

%    0th 'ring' = 1 base station
%       1st 'ring' = 6 base stations
%          ...
%             nth 'ring' = 6*n base stations
% total number of base stations in n 'rings' = 6*n*(n+1)/2 + 1

%   rotationAngle: degrees network rotated (clockwise)
%   xDisplacement: translate network, X-axis displacement (km)
%   yDisplacement: translate network, Y-axis displacement (km)

% debug: 1 = show debug messages


 
% fix the coordinates of the 'first' base station in the '0th' ring
x(1) = 0; y(1) = 0;
 
% ict counts the number of the base station sites
ict = 1;
 
% fix the coordinates of the other base stations in each ring
for i = 1:NumberOfbaseStationRings
    % here the 'initial sites' (on the first side) are calculated    
    for j = 1:i
        ict = ict +1;
        xr(j) = i - (j - 1)/2;
        x(ict) = xr(j);
        yr(j) = 0 + (j - 1)*sqrt(3)/2;
        y(ict) = yr(j);
    end
    
    for k = 1:5
        % for the coordinates of the base stations on each hex side, 
        %   rotate the coordinates of those on the initial side by
        %      multiples of theta = 60°
        thet = k*60;
        for j = 1:i
            ict = ict + 1;
            x(ict) = xr(j)*cosd(thet) - yr(j)*sind(thet);
            y(ict) = xr(j)*sind(thet) + yr(j)*cosd(thet);
        end       
    end   
end
 
% the calculation above is based on a 'unit' inter-sie distance (ISD)
%   the actual intersite distance is range*sqrt(3).
% so the calculated coordinates (above) must be scaled
x = sqrt(3)*cellRange*x; 
y = sqrt(3)*cellRange*y;
 
 
% rotate 
if rotationAngle ~= 0
    x = x*cosd(rotationAngle) - y*sind(rotationAngle);
    y = x*sind(rotationAngle) + y*cosd(rotationAngle);
end
 
% x displacement
x = x' + xDisplacement;

%  y displacement
y = y' + yDisplacement;

baseStationLocations = [x y];

if debug == 1
plot (x,y,'b*')
end

 end
