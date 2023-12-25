function createTransmissionLineCalculator()
    % Create the main figure for the GUI
    fig = figure('Name', 'Transmission Line Calculator', 'Position', [100, 100, 800, 700], 'Color', [0.95, 0.95, 0.95], 'MenuBar', 'none', 'NumberTitle', 'off', 'Resize', 'off');

    % Title
    titleStr = 'Transmission Line Calculator';
    titleWidth = length(titleStr) * 10; % Approximate width based on character count
    titleXPos = (800 - titleWidth) / 2; % Center the title
    uicontrol('Style', 'text', 'Position', [titleXPos, 650, titleWidth, 30], 'String', titleStr, 'FontSize', 12, 'BackgroundColor', [0.95, 0.95, 0.95], 'FontWeight', 'bold');

    % Dropdown for Conductor Type
    uicontrol('Style', 'text', 'Position', [50, 600, 200, 20], 'String', 'Conductor Type:', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    conductorTypeDropdown = uicontrol('Style', 'popupmenu', 'Position', [260, 600, 200, 20], 'String', {'Solid', 'Stranded'});

    % Dropdown for Conductor Type
    uicontrol('Style', 'text', 'Position', [50, 560, 200, 20], 'String', 'Stranded Type:', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    strandedDropdown = uicontrol('Style', 'popupmenu', 'Position', [260, 560, 200, 20], 'String', {'3-Triangle', '4-Row' , '4-Square' ,'7-Hexagonal' , '9-Square' });

    % Dropdown for Bundling
    uicontrol('Style', 'text', 'Position', [50, 520, 200, 20], 'String', 'Bundling Option:', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    bundlingDropdown = uicontrol('Style', 'popupmenu', 'Position', [260, 520, 200, 20], 'String', {'Non-Bundled', 'Bundled (<= 3)' , 'Bundled (> 3)'});

    % Input for number of conductors in a bundle
    uicontrol('Style', 'text', 'Position', [50, 480, 200, 20], 'String', 'Bundle Number:', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    bundleNumberInput = uicontrol('Style', 'edit', 'Position', [260, 480, 200, 20]);

    uicontrol('Style', 'text', 'Position', [50, 440, 200, 20], 'String', 'Space between Bundles (m):', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    spaceBetweenBundlesInput = uicontrol('Style', 'edit', 'Position', [260, 440, 200, 20]);

    % Input field for Conductor Radius
    uicontrol('Style', 'text', 'Position', [50, 400, 200, 20], 'String', 'Conductor Radius (m):', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    radiusInput = uicontrol('Style', 'edit', 'Position', [260, 400, 200, 20]);

    % Dropdown for Phase Configuration
    uicontrol('Style', 'text', 'Position', [50, 360, 200, 20], 'String', 'Phase Configuration:', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    phaseConfigDropdown = uicontrol('Style', 'popupmenu', 'Position', [260, 360, 200, 20], 'String', {'Single-Phase','Single-Phase Two-Wire' ,'Three-Phase'});

    % Input field for General Spacing
    uicontrol('Style', 'text', 'Position', [50, 320, 200, 20], 'String', 'General Spacing (m):', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    spacingInput = uicontrol('Style', 'edit', 'Position', [260, 320, 200, 20]);

   % Function to create additional input fields for three-phase configuration
    uicontrol('Style', 'text', 'Position', [50, 280, 200, 20], 'String', 'Spacing 1-2 (m):', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    spacing12Input = uicontrol('Style', 'edit', 'Position', [260, 280, 200, 20]);

    uicontrol('Style', 'text', 'Position', [50, 240, 200, 20], 'String', 'Spacing 2-3 (m):', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    spacing23Input = uicontrol('Style', 'edit', 'Position', [260, 240, 200, 20]);

    uicontrol('Style', 'text', 'Position', [50, 200, 200, 20], 'String', 'Spacing 1-3 (m):', 'HorizontalAlignment', 'left', 'BackgroundColor', [0.95, 0.95, 0.95]);
    spacing31Input = uicontrol('Style', 'edit', 'Position', [260, 200, 200, 20]);

    % Button for calculation, moved down for better spacing
    calculateButton = uicontrol('Style', 'pushbutton', 'Position', [340, 150, 120, 40], 'String', 'Calculate', 'FontSize', 10, 'FontWeight', 'bold');

    % Result labels for inductance and capacitance
    inductanceLabel = uicontrol('Style', 'text', 'Position', [50, 110, 700, 20], 'String', 'Inductance: ', 'BackgroundColor', [0.95, 0.95, 0.95], 'FontSize', 10, 'HorizontalAlignment', 'left');
    capacitanceLabel = uicontrol('Style', 'text', 'Position', [50, 80, 700, 20], 'String', 'Capacitance: ', 'BackgroundColor', [0.95, 0.95, 0.95], 'FontSize', 10, 'HorizontalAlignment', 'left');

    % Set callback for the calculate button
    set(calculateButton, 'Callback', @(src, event) calculateAndDisplayResults(conductorTypeDropdown, bundlingDropdown, bundleNumberInput, radiusInput, spacingInput, phaseConfigDropdown, spacing12Input, spacing23Input, spacing31Input, inductanceLabel, capacitanceLabel , strandedDropdown , spaceBetweenBundlesInput));
end
