clc
clear all
close all
%format long

%%%%Arrays of Temporally Averaged Velocities over 100 Frames
av_u_tot_100=textread('av_u_tot_100.txt','','delimiter',',');
av_v_tot_100=textread('av_v_tot_100.txt','','delimiter',',');

%%%%Performing Spacial Average over 1200 columns-->u_bar & v_bar
u_bar=mean(av_u_tot_100,1);
v_bar=mean(av_v_tot_100,1);

%%%%Plotting Mean Velocities
index=1:313;
coord=(index-1)*0.00965779;

figure
plot(coord,u_bar,'k',coord,v_bar,'b','LineWidth',3)
xlabel('Depth (mm)')
ylabel('Velocity (m/s)')
legend('Streamwise Velocity','Surface Normal Velocity')
set(gca,'fontsize',18)
figure
plot(u_bar,-coord,'k',v_bar,-coord,'b','LineWidth',3)
xlabel('Velocity (m/s)')
ylabel('Depth (mm)')
set(gca,'fontsize',18)
legend('Streamwise Velocity','Surface Normal Velocity')


figure
[vAxis,hLine1,hLine2]=plotyy(coord,u_bar,coord,v_bar)
xlabel('Depth (mm)')
ylabel(vAxis(1),'Velocity (m/s)');
ylabel(vAxis(2),'Velocity (m/s)');
legend('Streamwise Velocity','Surface Normal Velocity')
set(hLine1,'linewidth',3)
set(hLine1,'color','k')
set(hLine2,'linewidth',3)
set(hLine2,'color','b')
set(vAxis(1),'Ycolor','k')
set(vAxis(2),'Ycolor','b')
set(gca,'fontsize',18)
set(vAxis(2),'fontsize',18)

figure
xlabels{1}='Velocity (m/s)';
xlabels{2}='Velocity (m/s)';
ylabels{1}='Depth (mm)';
ylabels{2}='Depth (mm)';
[vAxis,hLine1,hLine2]=plotxx(u_bar,-coord,v_bar,-coord,xlabels,ylabels)
legend('Streamwise Velocity','Surface Normal Velocity')
set(hLine1,'linewidth',3)
set(hLine1,'color','k')
set(hLine2,'linewidth',3)
set(hLine2,'color','r')
set(vAxis(1),'Ycolor','k')
set(vAxis(2),'Ycolor','r')
set(gca,'fontsize',18)
set(vAxis,'fontsize',18)

figure
plot(coord,u_bar,'k','LineWidth',3)
xlabel('Depth (mm)')
ylabel('Velocity (m/s)')
set(gca,'fontsize',18)
figure
plot(u_bar,-coord,'k','LineWidth',3)
xlabel('Velocity (m/s)')
ylabel('Depth (mm)')
set(gca,'fontsize',18)

figure
plot(coord,v_bar,'k','LineWidth',3)
xlabel('Depth (mm)')
ylabel('Velocity (m/s)')
set(gca,'fontsize',18)
figure
plot(v_bar,-coord,'k','LineWidth',3)
xlabel('Velocity (m/s)')
ylabel('Depth (mm)')
set(gca,'fontsize',18)

%%%%Spacial, Temporal Average Over 100 Frames Calculating RMS
%%%%Importing
u_RMS_100=textread('u_RMS_100.txt','','delimiter',',');
v_RMS_100=textread('v_RMS_100.txt','','delimiter',',');
u_RMS=mean(u_RMS_100,1);
v_RMS=mean(v_RMS_100,1);

%%%%Plotting RMS

figure
plot(coord,u_RMS,'k',coord,v_RMS,'b','LineWidth',3)
xlabel('Depth (mm)')
ylabel('RMS Velocity')
legend('RMS Streamwise Velocity','RMS Surface Normal Velocity')
set(gca,'fontsize',18)
figure
plot(u_RMS,-coord,'k',v_RMS,-coord,'b','LineWidth',3)
xlabel('RMS Velocity')
ylabel('Depth (mm)')
set(gca,'fontsize',18)
legend('RMS Streamwise Velocity','RMS Surface Normal Velocity')


figure
[vAxis,hLine1,hLine2]=plotyy(coord,u_RMS,coord,v_RMS)
xlabel('Depth (mm)')
ylabel(vAxis(1),'RMS Velocity');
ylabel(vAxis(2),'RMS Velocity');
legend('RMS Streamwise Velocity','RMS Surface Normal Velocity')
set(hLine1,'linewidth',3)
set(hLine1,'color','k')
set(hLine2,'linewidth',3)
set(hLine2,'color','b')
set(vAxis(1),'Ycolor','k')
set(vAxis(2),'Ycolor','b')
set(gca,'fontsize',18)
set(vAxis(2),'fontsize',18)

figure
xlabels1{1}='RMS Velocity';
xlabels1{2}='RMS Velocity';
ylabels1{1}='Depth (mm)';
ylabels1{2}='Depth (mm)';
[vAxis,hLine1,hLine2]=plotxx(u_RMS,-coord,v_RMS,-coord,xlabels1,ylabels1)
legend('RMS Streamwise Velocity','RMS Surface Normal Velocity')
set(hLine1,'linewidth',3)
set(hLine1,'color','k')
set(hLine2,'linewidth',3)
set(hLine2,'color','r')
set(vAxis(1),'Ycolor','k')
set(vAxis(2),'Ycolor','r')
set(gca,'fontsize',18)
set(vAxis,'fontsize',18)

figure
plot(coord,u_RMS,'k','LineWidth',3)
xlabel('Depth (mm)')
ylabel('RMS Velocity')
set(gca,'fontsize',18)
figure
plot(u_RMS,-coord,'k','LineWidth',3)
xlabel('RMS Velocity')
ylabel('Depth (mm)')
set(gca,'fontsize',18)

figure
plot(coord,v_RMS,'k','LineWidth',3)
xlabel('Depth (mm)')
ylabel('RMS Velocity')
set(gca,'fontsize',18)
figure
plot(v_RMS,-coord,'k','LineWidth',3)
xlabel('RMS Velocity')
ylabel('Depth (mm)')
set(gca,'fontsize',18)
