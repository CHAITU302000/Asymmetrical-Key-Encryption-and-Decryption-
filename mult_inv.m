% Inputs
function e=mult_inv(d)
a = 288;
b = d;

% Compute GCD and Bezout's coefficients using the Extended Euclidean Algorithm
[gcd_ab, x, y] = gcd(a, b);

% Check if inverse exists
if gcd_ab ~= 1
    fprintf('Inverse of %d modulo %d does not exist\n', b, a);
else
    % Compute the inverse using Bezout's coefficients
    inv_b_mod_a = mod(y, a);
    e=inv_b_mod_a;
    fprintf('Inverse of %d modulo %d is %d\n', b, a, inv_b_mod_a);
end
end
