function [ Hc_tilde ] = Hc_tilde( t_index )

t = t_index;
global self;
 
Hc_tilde =  self.EIY_tilde(t) * self.sIY + self.EZI_tilde(t) * self.sZI + self.EIZ_tilde(t)* self.sIZ;

self.Hctrl_tilde(:,:,t) = Hc_tilde;

end
