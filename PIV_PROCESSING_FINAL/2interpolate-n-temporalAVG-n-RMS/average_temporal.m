%%%%Take each frame of interpolated data, average each value across array

clc
clear all
close all
%format long

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%Horizontal%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

list_u=dir('u_B*****.txt');
names_u={list_u.name};
n_u=size(names_u);
ck_u=textread('u_B00001.txt','','delimiter',',');
b_u(:,:,n_u(2))=zeros('like',ck_u);
for i_u=1:numel(names_u)
    a=textread(list_u(i_u).name,'','delimiter',',');
    b_u(1:1200,1:313,i_u)=a;
end

av_u_tot_f=mean(b_u,3);
dlmwrite('av_u_tot_100.txt',av_u_tot_f)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Vertical%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

list_v=dir('v_B*****.txt');
names_v={list_v.name};
n_v=size(names_v);
ck_v=textread('v_B00001.txt','','delimiter',',');
b_v(:,:,n_v(2))=zeros('like',ck_v);
for i_v=1:numel(names_v)
    a=textread(list_v(i_v).name,'','delimiter',',');
    b_v(1:1200,1:313,i_v)=a;
end

av_v_tot_f=mean(b_v,3);
dlmwrite('av_v_tot_100.txt',av_v_tot_f)