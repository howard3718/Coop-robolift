function [teethOptionsSpur,teethOptionsWheel] = teethData();
%Preferred standard gear teeth numbers - childs small book
teethOptionsSpur = [12,13,14,15,16,18,20,22,24,25,28,30,32,34,38,40,45,50,54,60,64,70,72,75,80,84,90,96,100,120];
%Available HPC wheel sizes. - taken from mod 0.5. 
teethOptionsWheel = [20;22;25;28;30;32;35;38;40;42;45;48;50;52;55;58;60;62;65;68;70;72;75;78;80;82;85;88;90;92;95;96;98;100]';

end