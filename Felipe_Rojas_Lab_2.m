clear
clc

%%POSICION DE LA MUNECA
syms e_rx e_ry e_rz e_x e_y e_z d7  %variables simbolicas

%se establece la matris de transformacion homogenea que 
%determina la posicion y orientacion del efector final 
Tef= trotz(e_rz)*troty(e_ry)*trotx(e_rx)*transl(e_x,e_y,e_z);

%se establecen las coordenadas (x,y,z) de la muñeca
x_w=vpa(Tef(1,4)-d7*Tef(1,3),4);
y_w=vpa(Tef(2,4)-d7*Tef(2,3),4);
z_w=vpa(Tef(2,4)-d7*Tef(2,3),4);

%% CINEMATICA INVERSA ARTICULACIONES 1, 2, 3 Y 4 

%declaracion de variables simbolicas
syms L1 L2 L3 L4 q4

%se determina el valor de q4
co_q4=cos(solve((z_w-L1)^2+x_w^2+y_w^2==(L4*cos(q4))^2+(L2+L3)^2+2*(L4*cos(q4))*(L2+L3)*cos(q4),q4));
co_q4=co_q4(1,1);
si_q4=sqrt(1-co_q4^2);
q4= atan2(si_q4,co_q4);

%se determina el valor de q2
q2=pi/2-(atan2(z_w-L1,x_w^2+y_w^2)+atan2(L4*cos(q4)*sin(q4),L2+L3+L4*cos(q4)^2));

%se determina el valode de q3
co_q3=(x_w^2+y_w^2-(L3*sin(q2+q4)+L3*sin(q2))^2-(L2*sin(q2))^2)/(2*(L3*sin(q2+q4)+L3*sin(q2))*(L2*sin(q2)));
si_q3=sqrt(1-co_q3^2);
q3=atan2(si_q3,co_q3);

%se determina el valor de q1
q1=atan2(y_w,x_w)+atan2((L3*sin(q2)+L4*sin(q2+q4))*sin(q3),L2*sin(q2)+(L3*sin(q2)+L4*sin(q2+q4))*cos(q3));

%% CINEMATICA DIRECTA 
syms q5 q6 q7

L(1) = Link('revolute','alpha', 0,      'a', 0,   'd',305.83,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(2) = Link('revolute','alpha', -pi/2,  'a', -30,    'd',0,   'offset', 0,   'modified', 'qlim',[-143.5*pi/180 43.5*pi/180]);
L(3) = Link('revolute','alpha', pi/2,      'a', 30, 'd',251.52,   'offset', 0,   'modified', 'qlim',[-168.5*pi/180 168.5*pi/180]);
L(4) = Link('revolute','alpha', -pi/2,      'a', 38.51, 'd',0,   'offset', -pi/2,   'modified', 'qlim',[-123.5*pi/180 80*pi/180]);
L(5) = Link('revolute','alpha', -pi/2,      'a', 42.37,   'd',267.01,   'offset', 0,   'modified', 'qlim',[-290*pi/180 290*pi/180]);
L(6) = Link('revolute','alpha', pi/2,      'a', -28.8,   'd',0,   'offset', 0,   'modified', 'qlim',[-88*pi/180 138*pi/180]);
L(7) = Link('revolute','alpha', -pi/2,      'a', 27.24,   'd',35.85,   'offset', 0,   'modified', 'qlim',[-229*pi/180 229*pi/180]);

% R = SerialLink(L,'name','IRB 14050')
% R.plot([q1 q2 q3 q4 q5 q6 q7],'workspace',[-50 50 -50 50 -50 50])
% hold on
% trplot(eye(4), 'width',2,'arrow')
% axis([-1000 1000 -1000 1000 0 1000])
% R.teach([q1 q2 q3 q4 q5 q6 q7])
% hold off

%% MATRICES DE ROTACION
R04=L(1).A(q1)*L(2).A(q2)*L(3).A(q3)*L(4).A(q4);
R04=R04(1:3,1:3);
R07=Tef(1:3,1:3);
R=R04'*R07;
q5=atan2(R(2,3),R(1,3));
q6=atan2(sqrt(1-R(3,3)^2),R(3,3));
q7=atan2(-R(3,2),R(3,1));