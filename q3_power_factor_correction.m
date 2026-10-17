clc; clear;
R_values = linspace(40.2, 40.3, 15); 
TableR = [];
TableX = [];
current = [];
PF = [];
ZS = 2 + 4i;    
ZP = 30 + 40i;  

for idx = 1:length(R_values)
    R = R_values(idx);
    syms x
    A = 32 * R + 44 * x - 100;
    B = 44 * R - 32 * x + 200;
    C = 30 + R;
    D = 40 - x;
    phi = acos(0.95); 
    tan_phi = tan(phi);
    EQ = (B * C - D * A)/(A * C + B * D) - tan_phi == 0;
    sol = solve(EQ, x);
    sol = double(sol(imag(sol) == 0));
    if ~isempty(sol)
        for X_val = sol.'
            TableR = [TableR; R];
            TableX = [TableX; -X_val]; 
        end
    end
end
for n = 1:length(TableR)
    R_branch = TableR(n);
    X_branch = TableX(n);
    Z_parallel = 1 / (1 / (R_branch + 1i * X_branch) + 1 / ZP);
    Z_eq = Z_parallel + ZS;
    I = abs(120 / Z_eq);
    phi_eq = angle(120 / Z_eq);
    PF_val = cos(phi_eq);
    current = [current; I];
    PF = [PF; PF_val];
end
table_data = [TableR, TableX, current, PF];
disp('Resistance  Reactance  Current  PowerFactor')
fprintf(' %10.6f %10.6f %10.6f %10.6f\n', table_data.')
