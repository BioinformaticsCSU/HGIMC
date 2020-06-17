function [B] = fNorm(A)
%% The normalization fuction of similarity matrix

[num1, num2] = size(A);
nM = zeros(num1, num2);
B = zeros(num1, num2);

for ii = 1:num1
    rnM(ii) = sum(A(ii, :));
end

for ij = 1:num2
    cnM(ij) = sum(A(:, ij));
end

for i = 1:num1
    rsum = rnM(i);
    for j = 1:num2
        csum = cnM(j);
        if((rsum==0) || (csum==0))
            B(i, j) = 0;
        else
            B(i, j) = A(i, j) / sqrt(rsum * csum);
        end
    end
end

end