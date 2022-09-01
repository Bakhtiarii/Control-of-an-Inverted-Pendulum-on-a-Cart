A = [0 1 0 0;0 -2.23 -0.2505 0.005183;0 0 0 1;0 2.253 10.15 -0.2101] ;
B = [0;0.223;0;-0.2253] ;
C1 = [1 0 0 0] ;
C2 = [0 0 1 0] ;
D = 0 ;

[m1,n1] = ss2tf(A,B,C1,D) ;
[m2,n2] = ss2tf(A,B,C2,D) ;

G1 = tf(m1,n1);                  % Chariot position
G2 = tf(m2,n2);                  % Pendulum angles 
s = tf('s');
pg1 = pole(G1);
G11 = minreal((s-pg1(2))*G1);
%pidTuner(G11,'p')
pg2 = pole(G2);
G22 = minreal((s-pg2(2))*G2);
pidTuner(G22,'p')
%% sisotool
sis = sisoinit(1);
%sis.C.Value = G1;
sis.C.Value = G2;
sis.OL1.View = {'rlocus','step'};
controlSystemDesigner(sis);
