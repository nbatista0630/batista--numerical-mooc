clc
clear all
close all
format long
%b=1;

%Scale Data from DaVis
factor=0.00965779; %Scale (mm/pixel)
offset_x=-3.83373; %x-coordinate in mm of origin (bottom left)
offset_y=4.36377;  %y-coordinate in mm of origin (top left)

%%% Import velocities data
%[Xdata1,Ydata1,Udata1,Vdata1] = textread([data_path,'\B00',num2str(b,'%03.0f'),'.txt'],'%f %f %f %f','headerlines',1);
[Xdata1,Ydata1,Udata1,Vdata1] = textread('B00001.txt','%f %f %f %f','headerlines',1);

nbcolon1=int32((max(Xdata1)-Xdata1(1))/(-Xdata1(1)+Xdata1(2)))+1; % nb of horizontal vector
nbline1=int32((min(Ydata1)-Ydata1(1))/(-Ydata1(1)+Ydata1(nbcolon1+2)))+1; % nb of vertical vector

% transform data vector in array (x,y)
Xtable1=reshape(Xdata1,nbcolon1,nbline1)';
Ytable1=reshape(Ydata1,nbcolon1,nbline1)'; 
deltaX=Xdata1(2)-Xdata1(1); %vector spacing
Utable1=reshape(Udata1,nbcolon1,nbline1)';
Vtable1=reshape(Vdata1,nbcolon1,nbline1)';

%%%Import Mask Data
X_mask=textread('xc_mask.txt');
Y_mask=textread('yc_mask.txt');

%%%Import Surface Index
index_o=textread('mask_index_r3_1.txt');
index_surf=index_o;
index_surf(index_surf==0)=1;
a=size(index_surf);

GRID_v=interp2(Xtable1,Ytable1,Vtable1,X_mask,Y_mask);
GRID_u=interp2(Xtable1,Ytable1,Utable1,X_mask,Y_mask);

figure
contour(GRID_v)
figure
contour(GRID_u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%Surf_v = Interpolated velocities (vertical) along surface
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:a(2)
    surf_v_00(i)=GRID_v(index_surf(i),i);
end
%figure
%plot(i,surf_v_00)

%%%%%Surf_v_05 = Interpolated velocities (vertical) 
%%%%%along depth 0.5 mm below surface

index_05=index_surf+52; %52 indices * factor = 0.50220508 mm, not 0.5mm exactly
for j=1:a(2)
    surf_v_05(j)=GRID_v(index_05(j),j);
end
%figure
%plot(j,surf_v_05)

%%%%%%Continuing to further depths (! CHANGE INDICIES AS SUGGESTED, ask tomorrow)

index_10=index_surf+104;
for k=1:a(2)
    surf_v_10(k)=GRID_v(index_10(k),k);
end
%figure
%plot(k,surf_v_10)

index_15=index_surf+156;
for l=1:a(2)
    surf_v_15(l)=GRID_v(index_15(l),l);
end
%figure
%plot(l,surf_v_15)

index_20=index_surf+208;
for m=1:a(2)
    surf_v_20(m)=GRID_v(index_20(m),m);
end
%figure
%plot(m,surf_v_20)

index_25=index_surf+260;
for n=1:a(2)
    surf_v_25(n)=GRID_v(index_25(n),n);
end
%figure
%plot(n,surf_v_25)

index_30=index_surf+312;
for o=1:a(2)
    surf_v_30(o)=GRID_v(index_30(o),o);
end
%figure
%plot(o,surf_v_25)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%Surf_u = Interpolated velocities (horizontal) along surface
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:a(2)
    surf_u_00(i)=-GRID_u(index_surf(i),i);
end
%figure
%plot(i,surf_v_00)

%%%%%Surf_v_05 = Interpolated velocities (vertical) 
%%%%%along depth 0.5 mm below surface

%index_05=index_surf+52; %52 indices * factor = 0.50220508 mm, not 0.5mm exactly
for j=1:a(2)
    surf_u_05(j)=-GRID_u(index_05(j),j);
end
%figure
%plot(j,surf_v_05)

%%%%%%Continuing to further depths (! CHANGE INDICIES AS SUGGESTED, ask tomorrow)

%index_10=index_surf+104;
for k=1:a(2)
    surf_u_10(k)=-GRID_u(index_10(k),k);
end
%figure
%plot(k,surf_v_10)

%index_15=index_surf+156;
for l=1:a(2)
    surf_u_15(l)=-GRID_u(index_15(l),l);
end
%figure
%plot(l,surf_v_15)

%index_20=index_surf+208;
for m=1:a(2)
    surf_u_20(m)=-GRID_u(index_20(m),m);
end
%figure
%plot(m,surf_v_20)

%index_25=index_surf+260;
for n=1:a(2)
    surf_u_25(n)=-GRID_u(index_25(n),n);
end
%figure
%plot(n,surf_v_25)

%index_30=index_surf+312;
for o=1:a(2)
    surf_u_30(o)=-GRID_u(index_30(o),o);
end
%figure
%plot(o,surf_v_25)

coord=1:a(2);
figure
plot(coord,surf_v_00,coord,surf_v_05,coord,surf_v_10,coord,surf_v_15,coord,surf_v_20,coord,surf_v_25,coord,surf_v_30)
title('Plot Vertical Velocity Along Frame at Different Instantaneous Depths from Surface')
legend('Surface','0.5mm','1.0mm','1.5mm','2.0mm','2.5mm','3.0mm')
xlabel('Frame Index')
ylabel('Velocity m/s')

figure
plot(coord,surf_u_00,coord,surf_u_05,coord,surf_u_10,coord,surf_u_15,coord,surf_u_20,coord,surf_u_25,coord,surf_u_30)
title('Plot Horizontal Velocity Along Frame at Different Instantaneous Depths from Surface')
legend('Surface','0.5mm','1.0mm','1.5mm','2.0mm','2.5mm','3.0mm')
xlabel('Frame Index')
ylabel('Velocity m/s')