A = [0 1 0 0;0 -2.23 -0.2505 0.005183;0 0 0 1;0 2.253 10.15 -0.2101] ;
B = [0;0.223;0;-0.2253] ;
C = [1 0 0 0;0 0 1 0] ;
Controllability = [B A*B A^2*B A^3*B];
disp('Controllability Matrix :')
disp(Controllability)
disp(['Controllability matrix Rank is : ' , num2str(rank(Controllability))])
Observability = [C; C*A; C*A^2; C*A^3];
disp('Observability Matrix :')
disp(Observability)
disp(['Observability matrix Rank is : ' , num2str(rank(Observability))])