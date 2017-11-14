function plotDTTgrid(Nrings, BSlocations, R, WiBRX)

    x = BSlocations(:,1);
    y = BSlocations(:,2);
    
%    larrow = R/2;
%    dir = [0 120 240];

    tri = [1 1 0 ; 0 1 0 ; 1 0 0];
    C = repmat(tri(3,:), (sum(1:Nrings))*6+1, 1);
    
    for k = 1:Nrings
        C((sum(1:k-1)*6+2):end,:) = repmat(tri(3-mod(k,3),:), size(C,1)-(sum(1:k-1)*6+2)+1, 1);
    end
   
    a = R*sqrt(3)/2;
    
    xhex = [-a 0 a a 0 -a];
    yhex = [-R/2 -R -R/2 R/2 R R/2];
    
%    xhexrot = xhex*cosd(rotang) - yhex*sind(rotang);
%    yhexrot = xhex*sind(rotang) + yhex*cosd(rotang);
    
    x1 = BSlocations(:,1) + xhex(1,:);
%    x2 = BSlocations(:,1) + xhexrot(2,:);
%    x3 = BSlocations(:,1) + xhexrot(3,:);
    
    y1 = BSlocations(:,2) + yhex(1,:);
%    y2 = BSlocations(:,2) + yhexrot(2,:);
%    y3 = BSlocations(:,2) + yhexrot(3,:);
    
    hold on
    axis equal

    for k = 1:size(x,1)
        patch(x1(k,:), y1(k,:), C(k,:));
%        patch(x2(k,:), y2(k,:), C(k,:));
%        patch(x3(k,:), y3(k,:), C(k,:));
    end
    
%    for k = 1:size(x,1)
%        quiver(BSlocations(k,1), BSlocations(k,2), larrow*cosd(dir(1)), larrow*sind(dir(1)), 'color', 'k', 'maxheadsize', 4);
%        quiver(BSlocations(k,1), BSlocations(k,2), larrow*cosd(dir(2)), larrow*sind(dir(2)), 'color', 'k', 'maxheadsize', 4);
%        quiver(BSlocations(k,1), BSlocations(k,2), larrow*cosd(dir(3)), larrow*sind(dir(3)), 'color', 'k', 'maxheadsize', 4);
%    end

%plot(dttTX(:,1), dttTX(:,2), 'k+') % Plot DTT transmitter

%cang = 0:.01:360;
%cx = dttR*cosd(cang);
%cy = dttR*sind(cang);
%plot(dttTX(:,1) + cx, dttTX(:,2) + cy, 'k'); % Plot DTT coverage circle

scatter(WiBRX(:,1), WiBRX(:,2), 'k') % Plot WiB Rx



