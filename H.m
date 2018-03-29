function [H] = H(t_index)
global self;

 t = t_index;
 H = self.Ho + Hc(t);
 self.Ht(:,:,t) = H;
  
end