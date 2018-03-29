function [O] = O(t_index)

global self;
t = t_index;

O = self.UT' * self.U(:,:,t);
end