function [dis] = distance(t_index)
 t = t_index;
 global self;
 dis = norm(self.UT - self.U(t), 'fro');
end