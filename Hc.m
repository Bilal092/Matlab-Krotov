function[ Hc ] = Hc(t_index)

t = t_index;
global self;
 
Hc = self.EIY(t) * self.sIY + self.EZI(t) * self.sZI + self.EIZ(t)* self.sIZ;

self.Hctrl( :, :, t) = Hc;

end