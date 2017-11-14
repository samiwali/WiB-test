function [pathDistancesNear, pathDistancesFar] = CalculatePathDistances (baseStationLocations, dttTxLocations)

pathDistancesNear = zeros(1, length(baseStationLocations));
pathDistancesFar = zeros(1, length(baseStationLocations));

xLengthNear = dttTxLocations(1,1) - baseStationLocations(:,1);
yLengthNear =dttTxLocations(1,2) - baseStationLocations(:,2);
pathDistancesNear=sqrt(xLengthNear.^2+yLengthNear.^2);


xLengthFar = dttTxLocations(2,1) - baseStationLocations(:,1);
yLengthFar =dttTxLocations(2,2) - baseStationLocations(:,2);
pathDistancesFar=sqrt(xLengthFar.^2+yLengthFar.^2);

end