function calculateAndDisplayResults(conductorTypeDropdown, bundlingDropdown, bundleNumberInput, radiusInput, spacingInput, phaseConfigDropdown, spacing12Input, spacing23Input, spacing31Input, inductanceLabel, capacitanceLabel, strandedDropdown, spaceBetweenBundlesInput)
    % Compatibility check for MATLAB version
    if isobject(conductorTypeDropdown) % For newer MATLAB versions (R2014b and later)
        conductorType = conductorTypeDropdown.String{conductorTypeDropdown.Value};
        bundling = bundlingDropdown.String{bundlingDropdown.Value};
        phaseConfig = phaseConfigDropdown.String{phaseConfigDropdown.Value};
        strandedType = strandedDropdown.String{strandedDropdown.Value};
    else % For older MATLAB versions
        conductorType = get(conductorTypeDropdown, 'String');
        conductorType = conductorType{get(conductorTypeDropdown, 'Value')};
        bundling = get(bundlingDropdown, 'String');
        bundling = bundling{get(bundlingDropdown, 'Value')};
        phaseConfig = get(phaseConfigDropdown, 'String');
        phaseConfig = phaseConfig{get(phaseConfigDropdown, 'Value')};
        strandedType = get(strandedDropdown, 'String');
        strandedType = strandedType{get(strandedDropdown, 'Value')};
    end

    % Retrieve additional spacing inputs for three-phase configuration
    spacing12 = str2double(get(spacing12Input, 'String'));
    spacing23 = str2double(get(spacing23Input, 'String'));
    spacing31 = str2double(get(spacing31Input, 'String'));

    if (STRCMP(strandedType, 'solid'))
        conductorType = 'solid';
        strandedType = '3-Triangle';
    end

    [strandedNum, strandedFactor] = getStrandedNumAndFactor(strandedType);

    % Retrieve and validate other inputs
    bundleNumber = str2double(get(bundleNumberInput, 'String'));
    radius = str2double(get(radiusInput, 'String'));
    spacing = str2double(get(spacingInput, 'String'));
    spaceBetweenBundles = str2double(get(spaceBetweenBundlesInput, 'String'));

    % Validate inputs
    if isnan(radius) || radius <= 0 || spacing <= 0
        errordlg('Invalid input values. Please enter positive numbers.', 'Input Error');
        return;
    end

    [L, C] = calculateInductanceCapacitance(conductorType, bundling, bundleNumber, radius, spacing, phaseConfig, strandedNum, strandedFactor, spaceBetweenBundles, spacing12, spacing23, spacing31);

    % Update result labels
    set(inductanceLabel, 'String', ['Inductance: ', num2str(L, '%.4e'), ' H/m']);
    set(capacitanceLabel, 'String', ['Capacitance: ', num2str(C, '%.4e'), ' F/m']);
end
