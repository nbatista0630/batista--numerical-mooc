clc
clear all
close all
%format long


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%Horizontal%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

u_bar=textread('av_u_tot_100.txt','','delimiter',',');
list_u=dir('u_B*****.txt');
names_u={list_u.name};
n_u=size(names_u);
ck_u=textread('u_B00001.txt','','delimiter',',');
ck_u_s=size(ck_u);
b_u(:,:,n_u(2))=zeros('like',ck_u);
for i_u=1:numel(names_u)
    a_u=textread(list_u(i_u).name,'','delimiter',',');
    b_u(1:ck_u_s(1),1:ck_u_s(2),i_u)=(a_u-u_bar).^2;
end

add_u=sum(b_u,3);
u_RMS=sqrt((1/n_u(2))*add_u);
dlmwrite('u_RMS_100.txt',u_RMS)

index_u=1:ck_u_s(2);
coord_u=(index_u-1)*0.00965779;
figure
hold on;
for i=1:ck_u_s(1)
    plot(coord_u,u_RMS(i,1:end))
end
title('u RMS vs Depth')
%legend('Surface','0.5mm','1.0mm','1.5mm','2.0mm','2.5mm','3.0mm')
xlabel('Depth (mm)')
ylabel('u RMS')
hold off;

%Contour Plot
figure
hold on;
for i_f=1:ck_u_s(1)
    contourf(coord_u,u_RMS(i_f,1:end))
end
title('u RMS vs Depth')
xlabel('Depth (mm)')
ylabel('u RMS')
hold off;

%Color Plot
figure
hold on;
for i_pc=1:ck_u_s(1)
    pcolor(coord_u,u_RMS(i_pc,1:end))
end
title('u RMS vs Depth')
xlabel('Depth (mm)')
ylabel('u RMS')
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Vertical%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v_bar=textread('av_v_tot_100.txt','','delimiter',',');
list_v=dir('v_B*****.txt');
names_v={list_v.name};
n_v=size(names_v);
ck_v=textread('v_B00001.txt','','delimiter',',');
ck_v_s=size(ck_v);
b_v(:,:,n_v(2))=zeros('like',ck_v);
for i_v=1:numel(names_v)
    a_v=textread(list_v(i_v).name,'','delimiter',',');
    b_v(1:ck_v_s(1),1:ck_v_s(2),i_v)=(a_v-v_bar).^2;
end

add_v=sum(b_v,3);
v_RMS=sqrt((1/n_v(2))*add_v);
dlmwrite('v_RMS_100.txt',v_RMS)

index_v=1:ck_v_s(2);
coord_v=(index_v-1)*0.00965779;
figure
hold on;
for j=1:ck_v_s(1)
    plot(coord_v,v_RMS(j,1:end))
end
title('v RMS vs Depth')
%legend('Surface','0.5mm','1.0mm','1.5mm','2.0mm','2.5mm','3.0mm')
xlabel('Depth (mm)')
ylabel('v RMS')
hold off;

%Contour Plot
figure
hold on;
for j_f=1:ck_v_s(1)
    contourf(coord_v,v_RMS(j_f,1:end))
end
title('v RMS vs Depth')
xlabel('Depth (mm)')
ylabel('v RMS')
hold off;

%Color Plot
figure
hold on;
for j_pc=1:ck_v_s(1)
    pcolor(coord_v,v_RMS(j_pc,1:end))
end
title('v RMS vs Depth')
xlabel('Depth (mm)')
ylabel('v RMS')
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%[Plot Average Velocities vs Depth along Frame]%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on;
for k=1:ck_u_s(1) 
    plot(coord_u,u_bar(k,1:end))
end
title('u bar vs Depth')
%legend('Surface','0.5mm','1.0mm','1.5mm','2.0mm','2.5mm','3.0mm')
xlabel('Depth (mm)')
ylabel('u bar (m/s)')
hold off;

figure
hold on;
for l=1:ck_v_s(1) 
    plot(coord_v,v_bar(l,1:end))
end
title('v bar vs Depth')
%legend('Surface','0.5mm','1.0mm','1.5mm','2.0mm','2.5mm','3.0mm')
xlabel('Depth (mm)')
ylabel('v bar (m/s)')
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%Averaging the Average%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%RMS calc:Average of 100 frames to 1 column, 
%compared to average of each frame to 1 column

u_bar_f=mean(u_bar,1);
list_u_f=dir('av_u_B*****.txt');
names_u_f={list_u_f.name};
n_u_f=size(names_u_f);
ck_u_f=textread('av_u_B00001.txt','','delimiter',',');
ck_u_s_f=size(ck_u_f);
b_u_f(:,:,n_u_f(2))=zeros('like',ck_u_f);

for i_u_f=1:numel(names_u_f)
    a_u_f=textread(list_u_f(i_u_f).name,'','delimiter',',');
    b_u_f(1:ck_u_s_f(1),1:ck_u_s_f(2),i_u_f)=(a_u_f-u_bar_f).^2;
end

add_u_f=sum(b_u_f,3);
u_RMS_f=sqrt((1/n_u_f(2))*add_u_f);
%dlmwrite('u_RMS_f_100.txt',u_RMS_f)
figure
plot(coord_u,u_RMS_f)
title('u RMS vs Depth, After Averaging Frames')
xlabel('Depth (mm)')
ylabel('u RMS')
hold off;

v_bar_f=mean(v_bar,1);
list_v_f=dir('av_v_B*****.txt');
names_v_f={list_v_f.name};
n_v_f=size(names_v_f);
ck_v_f=textread('av_v_B00001.txt','','delimiter',',');
ck_v_s_f=size(ck_v_f);
b_v_f(:,:,n_v_f(2))=zeros('like',ck_v_f);

for i_v_f=1:numel(names_v_f)
    a_v_f=textread(list_v_f(i_v_f).name,'','delimiter',',');
    b_v_f(1:ck_v_s_f(1),1:ck_v_s_f(2),i_v_f)=(a_v_f-v_bar_f).^2;
end

add_v_f=sum(b_v_f,3);
v_RMS_f=sqrt((1/n_v_f(2))*add_v_f);
%dlmwrite('v_RMS_f_100.txt',v_RMS_f)
figure
plot(coord_v,v_RMS_f)
title('v RMS vs Depth, After Averaging Frames')
xlabel('Depth (mm)')
ylabel('v RMS')
hold off;
