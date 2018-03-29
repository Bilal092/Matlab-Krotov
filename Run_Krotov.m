function Run_Krotov( iterations)

global self;
T = self.steps;
evolution_Ui();
self.overlap = zeros(self.iterations,1);
self.dis = zeros(self.iterations,1);

for i = 1 : iterations %range(0,num_iter):
 fprintf ('Cycle :  %d \n' ,  i)
 self.B( :, :, self.steps) = self.UT';
 evolution_B();
 evolution_U();
 self.overlap(i) = Overlap(T + 1);
 self.dis(i) = distance(T + 1);
            
end

end
