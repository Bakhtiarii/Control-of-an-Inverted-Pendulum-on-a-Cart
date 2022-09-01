A = [0 1 0 0;0 -2.23 -0.2505 0.005183;0 0 0 1;0 2.253 10.15 -0.2101] ;
B = [0;0.223;0;-0.2253] ;
C1 = [1 0 0 0] ;
C2 = [0 0 1 0] ;
D = 0 ;

[m1,n1] = ss2tf(A,B,C1,D) ;
[m2,n2] = ss2tf(A,B,C2,D) ;

G1 = tf(m1,n1) ;                  % Chariot position
G2 = tf(m2,n2) ;                  % Pendulum angle

pidTuner(G2,'pid')


        