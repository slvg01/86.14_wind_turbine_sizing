% variables
cost_m2 = 300; % cost of additional square meter for the rotor (€/m²)
cost_ms = 1e6; % cost of additional wind speed capture (€/m/s)
budget = 1e7; % Budget total (€)
stab = 1500; % stability factor
syms x y a lambda mu % declare the lagrangian variables for symbolic use

% budget and stability constraints
g = cost_m2 * x + cost_ms * y - budget;
h = x - stab * y + a^2;

% Lagrangien and related partial derivative
L = 0.38 * x * y^3 - lambda * h - mu * g;
dL_dx = diff(L, x);
dL_dy = diff(L, y);
dL_da = diff(L, a);
dL_dl = diff(L, lambda);
dL_dm = diff(L, mu);

% Case 1: a = 0 // Case 2: lambda = 0
solutions_case1 = solve([dL_dx == 0, dL_dy == 0, dL_da == 0, dL_dl == 0, dL_dm == 0, a == 0], [x, y, a, lambda, mu]);
solutions_case2 = solve([dL_dx == 0, dL_dy == 0, dL_da == 0, dL_dl == 0, dL_dm == 0, lambda == 0], [x, y, a, lambda, mu]);

% Display the solution
case_list = {'a=0', 'lambda=0'};
solutions_list = {solutions_case1, solutions_case2};

for i = 1:length(case_list)
    disp(' ')
    disp(['Optimum solution for case ', case_list{i}, ':']);
    solutions = solutions_list{i};
    x_value = double(solutions.x);
    y_value = double(solutions.y);

    % Exclude null solution 
    valid_solutions = ~(x_value == 0 | y_value == 0);
    x_value = x_value(valid_solutions);
    y_value = y_value(valid_solutions);
    
    % Verify respect stability and budget constraint and display
    if x_value <= stab * y_value & cost_m2 * x_value + cost_ms * y_value <= budget
            disp(['pale length = ', num2str(sqrt(x_value(1)/pi)), ' m']);
            disp(['rotor surface = ', num2str(x_value(1)), ' m²']);
            disp(['wind speed = ', num2str(y_value(1)), ' m/s']);
            disp(['Puissance : P = ', num2str(0.38 * x_value(1) * y_value(1)^3 / 1000000), ' MW']);      
    else
        disp('No solution respecting the budgetary and stability constraints.')
    end
end
