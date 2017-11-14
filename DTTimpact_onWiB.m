clear variables
close all
clc

cellRangeKm = 30;
NumberOfbaseStationRings = 2;
dttCoverageRadius = 0;
azimutCentralSdlCellClockwise = 0;
separationDistance = 30;
SdlTransmitterHeight = 30;
SdlAntennaTilt = 0;
DttReceiverHeight = 10;
frequencyMhz = 562;
pathType = 'Land';
TransmitterEnvironmentType = 'Urban';
ReceiverEnvironmentType = 'Urban';
maxTransmitterAntennaGainDbi = 12;
txAntennaHorizontalBeamwidth = 30;
polarisation = 0;
sdlMaxEirpDbm = 60;
gainRxAntennaDbi = 12;
standardDeviationInterferer = 5.5;
wantedMedianDbm = 49;
standardDeviationWanted = 5.5;
k = 1.38064852e-23;
T = 290;
B = 7.61e6;
receiverNoiseLevel = k*T*B;
minSignalNoiseRatio = 20;

% dttTransmitterLocation = [separationDistance + NumberOfbaseStationRings*(3/2)*cellRangeKm + dttCoverageRadius 0];

% Step 1

% baseStationLocations = CreateBaseStationGrid(cellRangeKm, NumberOfbaseStationRings,azimutCentralSdlCellClockwise);
baseStationLocations = CalculateBaseStationLocations(cellRangeKm, NumberOfbaseStationRings, azimutCentralSdlCellClockwise, 0, 0, 0);

% Step 2a DTT receiver locations

WiBReceiverLocations = CalculateWiBReceiverLocations(cellRangeKm);

% Step 3a

[pathDistancesNear, pathDistancesFar] = CalculatePathDistances(baseStationLocations, WiBReceiverLocations);

% Plotting of the BS grid with DTT TX and RX

plotDTTgrid(NumberOfbaseStationRings, baseStationLocations, cellRangeKm, WiBReceiverLocations);

