A = [0 1 0 0;0 -2.23 -0.2505 0.005183;0 0 0 1;0 2.253 10.15 -0.2101] ;
B = [0;0.223;0;-0.2253] ;
C1 = [1 0 0 0] ;
C2 = [0 0 1 0] ;
D = 0 ;

[m1,n1] = ss2tf(A,B,C1,D) ;
[m2,n2] = ss2tf(A,B,C2,D) ;

G1 = tf(m1,n1) ;                  % Chariot position
G2 = tf(m2,n2) ;                  % Pendulum angle

C1 = tf([-2.28 6.992532],1) ;
C2 = tf([-24.7018 75.75795042],1) ;

x_d = tf(0.4,[1 0],'InputDelay',30) + tf(-0.8,[1 0],'InputDelay',60) + tf(0.4,[1 0],'InputDelay',90) ;
teta_d = 0 ;

Temp = tf([1 0],1) ;
%% Without using reduce system degree
x = ((Temp*(((1+(G2*C2))*((G1*C1*x_d)+(G1*C2*teta_d)))-(G1*G2*C2*((C1*x_d)+(C2*teta_d)))))/(1+(G1*C1)+(G2*C2)+(2*G1*G2*C1*C2))) ; 
teta = ((Temp*(((1+(G1*C1))*((G2*C1*x_d)+(G2*C2*teta_d)))-(G1*G2*C1*((C1*x_d)+(C2*teta_d)))))/(1+(G1*C1)+(G2*C2)+(2*G1*G2*C1*C2))) ;

%% reduce system degree  ( impossible in reality )
%x = (minreal((Temp*(((1+(G2*C2))*((G1*C1*x_d)+(G1*C2*teta_d)))-(G1*G2*C2*((C1*x_d)+(C2*teta_d))))),0.01)/minreal((1+(G1*C1)+(G2*C2)+(2*G1*G2*C1*C2)),0.1)) ; 
%teta = (minreal((Temp*(((1+(G1*C1))*((G2*C1*x_d)+(G2*C2*teta_d)))-(G1*G2*C1*((C1*x_d)+(C2*teta_d))))),0.01)/minreal((1+(G1*C1)+(G2*C2)+(2*G1*G2*C1*C2)),0.1)) ;

%% Plot x , teta
step(x,100) ;
%step(teta,100) ;
