function [B] = fGRB(A, sigma)
%% GRB: Gaussian Radial Basis Function
% Usage:  [B] = fGRB(A, sigma)
%
% Inputs:
%        A                 - the original similarity matrix.
%        sigma             - Gaussian bandwidth.
%
% Outputs:
%        B                 - the comprehensive similarity matrix.
%
% Written by: Mengyun Yang
% Email: mengyunyang@csu.edu.cn
 
[m, n] = size(A);

for i = 1:m
    for j = 1:i
        B(i, j) = exp(-norm(A(i, :) - A(j, :))^2 / (2 * sigma^2));
        B(j, i) = B(i, j);
    end
end

end
