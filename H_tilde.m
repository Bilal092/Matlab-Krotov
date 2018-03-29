function [ H_tilde ] =  H_tilde(t_index)
 
global self;
t = t_index;

H_tilde = self. Ho + Hc_tilde(t);
self.Ht_tilde(:, :, t) = H_tilde;

end
