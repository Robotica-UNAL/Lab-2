clear
clc

%se cargan las variables del robot IRB 14050 en posicion de calibracion
load('RSTcalibradoEscala')

% Obtain puma1 An arbitrary configuration of
randConfig = calib;

% Use this transform as the target pose for the end effector
tform = getTransform(robot,randConfig,'b7');

% Establish robor Model ik object
ik = inverseKinematics('RigidBodyTree',robot);
% I don't know why I want to set the weight of different components of the pose. The estimation is related to the specific algorithm
% For the bearing component, use a weight smaller than the position component
weights = [0.25 0.25 0.25 0.5 1 0.5 ];

% The robot's home Joint angle of configuration as initial guess
initialguess = home;
% Inverse solution of joint angle according to the expected position and pose of end effector
[configSoln,solnInfo] = ik('b7',tform,weights,initialguess);

figure(1)
show(robot,configSoln)
figure(2)
show(robot,randConfig)
%https://programmer.help/blogs/robotics-system-toolbox-learning-notes-inverse-kinematics-related-functions.html