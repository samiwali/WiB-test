function WiBReceiverLocations = CalculateWiBReceiverLocations(cellRangeKm)
WiBReceiverLocations(1,2)=-cellRangeKm/2;
WiBReceiverLocations(2,2)=-cellRangeKm/2;
WiBReceiverLocations(1,1)=-cellRangeKm*sqrt(3)/2;
WiBReceiverLocations(2,1)=-cellRangeKm*sqrt(3)/2;

end
