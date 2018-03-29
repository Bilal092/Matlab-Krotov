function update_E(t_index)
 t=t_index;
 global self;
 
EIYpart1 = (1-self.delta2) * self.EIY_tilde(t-1);
EIYpart2 = -self.delta2 * self.lambda_1 * imag( trace(self.B(t-1) * self.sIY *  self.U(t)) ) / self.alpha2;
self.EIY(t) = (EIYpart1 + EIYpart2);

EZIpart1 = (1-self.delta3) * self.EZI_tilde(t-1);
EZIpart2 = -self.delta2 * self.lambda_1 * imag( trace(self.B(t-1) * self.sZI *  self.U(t)) ) / self.alpha3;
self.EZI(t) = (EZIpart1 + EZIpart2);

EIZpart1 = (1-self.delta3) * self.EIZ_tilde(t-1);
EIZpart2 = -self.delta3 * self.lambda_1 * imag( trace(self.B(t-1) * self.sIZ *  self.U(t)) ) / self.alpha4;
self.EIZ(t) = (EIZpart1 + EIZpart2);

end
