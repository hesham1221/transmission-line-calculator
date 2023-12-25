function [num, factor] = getStrandedNumAndFactor(conductorConfig)
    % This function returns the number of strands and associated factor
    % for different conductor configurations.
    switch conductorConfig
        case '3-Triangle'
            num = 3;
            factor = 1.587;
        case '4-Row'
            num = 4;
            factor = 2.294;
        case '4-Square'
            num = 4;
            factor = 1.834;
        case '7-Hexagonal'
            num = 7;
            factor = 2.558;
        case '9-Square'
            num = 9;
            factor = 2.712;
        otherwise
            error('Unknown conductor configuration.');
    end
end