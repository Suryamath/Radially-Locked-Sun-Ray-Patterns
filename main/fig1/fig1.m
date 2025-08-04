clear all
close all
clc

load("growth.mat")

delta = [3.5 4 5 10];  % Parameter values for delta
dk = linspace(0,25,100); % Parameter values for k
dksize = length(dk);           % Number of iterations for parameter set dk
deltasize = length(delta);     % Number of iterations for parameter set delta

resultsFolder = [pwd];         % Folder path to save the results
growth = zeros(deltasize, dksize);

colormapData=colormap('jet');
pl=[4 3 2 1];

for i = 1:4
    % Color for the fitted curve
    colorIndex = round((i - 1) / (deltasize - 1) * (length(colormapData) - 1)) + 1;
    
    % Plot the fitted curve and hide the original data
    plot1(i) = plot(dk, Qs_growth{1,i}, 'LineWidth', 1.2, 'Color', colormapData(colorIndex,:));
    set(plot1(i), 'DisplayName', sprintf('$\\delta=%.1f$', delta(pl(i))));
    hold on
end


% Example of modifying linestyle for delta=1
set(plot1(1), 'LineStyle', '--');



%% loading griwth for Q=160

dk = linspace(0,50,100); % Parameter values for dw
dksize = length(dk);           % Number of iterations for parameter set dw
deltasize = length(delta); 

pl=[4 3 2 1]

for i = 1:4
    colorIndex = round((i - 1) / (deltasize - 1) * (length(colormapData) - 1)) + 1;
    
    % Plot the fitted curve and hide the original data
    plot1(i) = plot(dk, Qs_growth{2,i}, 'LineWidth', 1.2, 'Color', colormapData(colorIndex,:));
    set(plot1(i), 'DisplayName', sprintf('$\\delta=%.1f$', delta(pl(i))));
    hold on
end


% Example of modifying linestyle for delta=1
set(plot1(1), 'LineStyle', '--');

% Set plot limits
xlim([0.4 45]);
ylim([-0.0008 0.004]);

% Customize legend appearance
set(legend, 'Interpreter', 'latex');
ylabel('$\sigma$', 'FontSize', 20, 'Interpreter', 'latex');
xlabel('$k$', 'FontSize', 20, 'Interpreter', 'latex');
set(legend, ...
    'Position', [0.667231203945441 0.627634156900158 0.232774674115456 0.306190793557919], ...
    'Interpreter', 'latex', ...
    'FontSize', 15, ...
    'EdgeColor', 'none', ...
    'Color', 'none','NumColumns',2);
