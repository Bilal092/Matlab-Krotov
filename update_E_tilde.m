function  update_E_tilde(t_index)
global self;
 t=t_index;

EIYpart1 = (1-self.delta2) * self.EIY(t);
EIYpart2 = -self.delta2 * self.lambda_1 * imag( trace(self.B(t) * self.sIY * self.U(t))) / self.alpha2;
self.EIY_tilde(t) =- (EIYpart1 + EIYpart2);
        
EZIpart1 = (1-self.delta3) * self.EZI(t);
EZIpart2 = -self.delta3 * self.lambda_1 * imag( trace(self.B(t) * self.sZI * self.U(t))) / self.alpha3;
self.EZI_tilde(t) = -(EZIpart1 + EZIpart2);

EIZpart1 = (1-self.delta2) * self.EIZ(t);
EIZpart2 = -self.delta4 * self.lambda_1 * imag( trace(self.B(t) * self.sIZ * self.U(t))) / self.alpha4;
self.EIZ_tilde(t) = -(EIZpart1 + EIZpart2);
        
end
