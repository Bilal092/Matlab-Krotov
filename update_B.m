function update_B (t_index)
t = t_index;
global self;
        
self.B(:, :,t-1) = self.B(:, :, t) * expm(1j * H_tilde(t) * self.dt);


end