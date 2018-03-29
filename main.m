
% This Code is Written By Bilal Riaz
% to Implement CNOT gate for Closed Quantum Systems 
% with Ising type Drift Hamiltonians 
% 
%%
  clear all;
  format long;
 %%
  J = 1;
  ti = 0;
  tf  = 8;
  steps = 5000;
  iterations = 10;
  lambda_1 = 0.1e-1;
  
  
 %  Control Hamiltonians
 sx = [0 1; 1 0];
 sy = [0 -1j; 1j 0];
 sz = [1 0; 0 -1];
 si = eye(2);
 
 syi = kron(sy, si);
 siy = kron(si, sy);
 siz = kron(si, sz);
 szi = kron(sz, si);
 szz = kron(sz, sz);
%%
 % Drift Hamiltonian
 Ho = J * szz;
 
 % Desired Evolution operator
 
 UT = exp(-1i*pi/4)*  [0 1 0 0;
                       1 0 0 0;
                       0 0 1 0;
                       0 0 0 1];
                   
 U0 = eye(4);

 
 %%
 
 
 % structure to compute details
 global self   %this name is inspired from Python's class 'self' variable;
 
self.J = J;
self.ti = ti;
self.tf = tf;
self.steps = steps;
self.t = linspace(ti,tf,steps);

self.iterations = iterations;

self.dis = zeros(iterations, 1);
self.overlap = zeros(iterations, 1);

self.dt = self.t(2) - self.t(1);
self.sX = [0, 1; 1, 0];
self.sY = [0, -1j; 1j, 0];
self.sZ = [1, 0; 0, -1];
self.I = eye(2);

% possible drift and control Hamilltonians 
self.sZZ = kron(self.sZ, self.sZ);
self.sIY = kron(self.I, self.sY);
self.sYI = kron(self.sY, self.I);
self.sIZ = kron(self.I, self.sZ);
self.sZI = kron(self.sZ, self.I);

self.delta1 = 0;
self.alpha1 = 1;
self.delta2 = 0.1;
self.alpha2 = 0.1;

self.delta3 = 0.1;
self.alpha3 = 0.1;

self.delta4 = 0.1;
self.alpha4 = 0.1;

self.lambda_1 = lambda_1;

self.overlap = zeros(1, self.iterations);
self.dis = zeros(1, self.iterations);

       % seed is given values for better debugging and Design Purposes
%seed(0);
rng(0);

self.EIY = rand(self.steps, 1)-0.5;
self.EIY_tilde = zeros(self.steps, 1);
       
self.EZI = rand(self.steps, 1)-0.5;
self.EZI_tilde = zeros(self.steps, 1);

self.EIZ = rand(self.steps, 1)-0.5;
self.EIZ_tilde = zeros(self.steps, 1);

self.Ui = eye(4);
self.UT = exp(1j * pi/4)*[1, 0, 0, 0; 
                          0, 1, 0, 0;
                          0, 0, 0, 1;
                           0, 0, 1, 0];
                                     
self.U = zeros( 4, 4, self.steps  );        
self.B = zeros( 4, 4, self.steps  );   

self.U( :, :,1) = eye(4);
self.B(:, :, steps + 1) = self.UT';    

self.Ho = self.J * self.sZZ;
self.Hctrl = zeros(4, 4, self.steps ); 
self.Hctrl_tilde = zeros( 4, 4, self.steps ); 

self.Ht = zeros( 4, 4, self.steps ); 
self.Ht_tilde = zeros( 4, 4, self.steps ); 

evolution_Ui();
 
 %%
 
 Run_Krotov( iterations)
 
%%
iter = 1:self.iterations;
semilogx(iter, self.overlap/4)   


%%
plot(self.t, self.EZI)
