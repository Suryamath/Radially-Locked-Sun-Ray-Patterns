clear all
close all
clc

load("fig3b.mat")

i_on= find(xamp>0.001,1,'first');
t_on=tvec(i_on);

% Initialize a cell array to store x-peaks for each time step
xPeaks = cell(1, length(tvec));
legendLabels = cell(length(tvec), 1); % Initialize an empty cell array for legend labels

hold on

for t = i_on:length(tvec)
    minimaIdx = findLocalMinima(data{1,1}.timeData1(t).avB_X(:),2);
    scatter(rf(t).*nT(minimaIdx), repmat(tvec(t), size(minimaIdx)),3, 'o',MarkerFaceColor=[0.01,0.01,0.52],MarkerEdgeColor=[0.01,0.01,0.52]);
    locs{t-i_on+1}=rf(t) *nT(minimaIdx);
end

hold on
set(gca,'XDir','reverse','XMinorTick','on','YDir','reverse');
view([270 270]);
xlabel('$\theta r_{f}(t)$','FontSize',15,'Interpreter','latex');
ylabel('$t$','FontSize',15,'Interpreter','latex');
xlim([-750 750]);
hold(gca,'on');
set(gca,'FontWeight','bold',fontsize=20);
set(gca, 'Clipping', 'off');


function minimaIndices = findLocalMinima(data, windowSize)
    % Initialize the output indices
    minimaIndices = [];

    % Iterate through the data, skipping the edges
    for i = (1 + windowSize):(length(data) - windowSize)
        % Check if the point is a local minimum based on the condition
        if data(i) < min(data(i - windowSize:i-1)) && ...
                data(i) < min(data(i+1:i+windowSize)) 
            minimaIndices = [minimaIndices, i];
        end
    end
end