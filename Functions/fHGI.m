function [T_recovery] = fHGI(alpha, A_DD, A_RR, A_DR)
%% HGI: Heterogeneous Graph Inference
normWdd = fNorm(A_DD);
normWrr = fNorm(A_RR); % similarity matrices A_RR and A_DD arenormalized
Wdr0 = A_DR;

Wdr_i = Wdr0;
Wdr_I = alpha * normWdd * Wdr_i * normWrr + (1 - alpha) * Wdr0;

while(max(max(abs(Wdr_I - Wdr_i))) > 10^-10)
    Wdr_i = Wdr_I;
    Wdr_I = alpha * normWdd * Wdr_i * normWrr + (1 - alpha) * Wdr0;
end

T_recovery = Wdr_I;

end
