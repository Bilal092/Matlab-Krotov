function evolution_B()

global self;
        
for t = self.steps : -1 : 2;
    update_E_tilde(t);
    update_B(t);
end
t = 1;
update_E_tilde(t);

end
