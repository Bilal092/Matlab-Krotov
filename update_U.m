function update_U ( t_index)
  
  t = t_index;
  global self;
  self.U(:,:,t+1) = expm(-1j *  H(t) * self.dt) * self.U(:,:,t);
  
end