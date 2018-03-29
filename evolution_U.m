function  evolution_U()
global self;

for t  = 2 : self.steps 
    update_E(t);
    update_U(t);
end

k = self.steps;
update_E(k);
  
end