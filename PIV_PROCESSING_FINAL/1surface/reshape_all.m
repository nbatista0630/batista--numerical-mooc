clc
clear all
close all
%format long

dirData = dir('mask_index_r3_B*****.txt');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names
for iFile = 1:numel(fileNames)  %# Loop over the file names
    a=textread(dirData(iFile).name);
    %b=reshape(a,1,[]);
    b=reshape(a.',1,numel(a));
    newName = sprintf('mask_index_r3_F%05d.txt',iFile);
    c=b(1:end-1);
    dlmwrite(newName,c)
end