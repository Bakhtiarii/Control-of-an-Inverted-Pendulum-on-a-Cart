A = [0 1 0 0;0 -2.2626 -0.3963 0.0082;0 0 0 1;0 3.5649 16.0655 -0.3324] ;
B = [0;0.2263;0;-0.3565] ;
C = [1 0 0 0] ;
D = 0 ;

[b,a] = ss2tf(A,B,C,D) ;
G = tf(b,a) ;
rlocus(G) 
% Find K
Controllability = [B A*B A^2*B A^3*B] ;
Psi = [1 2.595 -15.34 -34.94;0 1 2.595 -15.34;0 0 1 2.595;0 0 0 1] ;
Alfa_1 = [34 431 2414 5040] ;
Alfa_2 = [5 8.75 6.25 1.5] ;
a = [2.595 -15.34 -34.94 0] ;
K1 = (Alfa_1-a)*inv(Psi)*inv(Controllability) ;             % Fast pole
K2 = (Alfa_2-a)*inv(Psi)*inv(Controllability) ;             % Slow pole
%%
p1 = [-10 -9 -8 -7];
p2 = [-2 -1.5 -1 -0.5];
KK1 = place(A,B,p1);
KK2 = place(A,B,p2);