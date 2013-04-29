function [ p ] = p_max_find( x, dx )
%P_MAX_FIND Calculate the step sizes
%   find max{p : x + p*dx >= 0) OR
lob = -inf;
hib = inf;
for n=(1:length(x)),
    if dx(n) == 0,
        % The is no bound on p if x >= 0
        if x < 0,
            error('No such p exists');
        end
        continue
    end
    ptmp = -1 * x(n) / dx(n);
    if dx(n) < 0, % There is an upper bound on p
        if ptmp < hib,
            hib = ptmp;
        end
    end
    if dx(n) > 0, % The is a lower bound on p
        if ptmp > lob,
            lob = ptmp;
        end
    end
    if hib < lob, % If upper bound lower than lower bound, no p exists
        error('Upper bound lower than lower. No p exists.');
    end
end
p = hib;
end

