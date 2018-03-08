%Data collected on Bear on 2018-02-27
clc;
clear;
format longg;

q_B_M = eul2quat([3.14159265359,0,0], 'XYZ');
B_r_B_M = [0.062; 0.05755; 0.1837];
T_B_M = [quat2rotm(q_B_M), B_r_B_M;
         0 0 0,            1];

q_M_V = [0.00801796591873, -0.999901512679, 0.00321801012417, 0.0110599084796];
M_r_M_V = [0.326459175607; 0.0690893543912; 0.0367252936114];
T_M_V = [quat2rotm(q_M_V), M_r_M_V;
         0 0 0,            1];
     
T_B_V = T_B_M * T_M_V;

B_r_B_V = T_B_V(1:3,4);
R_B_V = T_B_V(1:3,1:3);
q_B_V = rotm2quat(R_B_V);
rpy_BPosemeas = rotm2eul(R_B_V, 'XYZ');

display(B_r_B_V);
display(rpy_BPosemeas);