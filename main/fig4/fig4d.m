% Data for different [SPA] concentrations
flow_rate_27 = [4];
amplitude_27 = [0];
error_27 = [NaN];

flow_rate_29_4 = [2,2.5,3,3.5,4];
amplitude_29_4 = [0.1,0.27,0.58537,0.6761,0.73];
error_29_4 = [0.1112,0.13229,0.13473,0.03209,0.025];

flow_rate_30 = [1,1.5,2,2.5,3,3.5,4];
amplitude_30 = [0.54773,0.7369,1.00173,1.19143,1.28877,1.46967,1.82633];
error_30 = [0.01068,0.08683,0.08472,0.03181,0.12422,0.13248,0.22501];


flow_rate_30_6 = [0.5,1,1.5,2,2.5,3];
amplitude_30_6 = [1.3429,2.02527,2.8255,3.47173,3.78257,3.8575];
error_30_6 = [0.3074,0.19119,0.43962,0.41118,0.51405,0.99799];

% Create figure
figure;
hold on;

% % Plot data with error bars
% errorbar(flow_rate_27, amplitude_27, error_27, 'ko', 'MarkerFaceColor', 'none');
% errorbar(flow_rate_29_4, amplitude_29_4, error_29_4, 'o', 'MarkerEdgeColor', [0.5, 0.5, 1], 'MarkerFaceColor', [0.7, 0.7, 1]);
% errorbar(flow_rate_30, amplitude_30, error_30, 'bo', 'MarkerFaceColor', 'blue');
% errorbar(flow_rate_30_6, amplitude_30_6, error_30_6, 'o', 'MarkerEdgeColor', [0, 0, 1], 'MarkerFaceColor', [0, 0, 1]);
% 


% % Create axes
% gca = axes('Parent',figure1,...
%     'Position',[0.13 0.131904758498782 0.645 0.793095241501218]);
hold(gca,'on');

% Create errorbar
errorbar(flow_rate_27, amplitude_27, error_27,'DisplayName','[SPA]_0 = 27 mM','MarkerSize',8,...
    'MarkerFaceColor',[0.490196078431373 0.4 0.929411764705882],...
    'MarkerEdgeColor',[0.0705882352941176 0.274509803921569 0.788235294117647],...
    'Marker','diamond',...
    'LineStyle','none',...
    'Color',[0 0 0]);

% Create errorbar
errorbar(flow_rate_29_4, amplitude_29_4, error_29_4,'DisplayName','[SPA]_0 = 29.4 mM','MarkerSize',8,...
    'MarkerFaceColor',[0.929411764705882 0.4 0.682352941176471],...
    'MarkerEdgeColor',[0.788235294117647 0.0705882352941176 0.6],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.32156862745098 0.0117647058823529 0.227450980392157]);

% Create errorbar
errorbar(flow_rate_30, amplitude_30, error_30,'DisplayName','[SPA]_0 = 30 mM','MarkerSize',8,...
    'MarkerFaceColor',[0.00,0.81,0.01],...
    'MarkerEdgeColor',[0.00,0.81,0.01],...
    'Marker','*',...
    'LineStyle','none',...
    'Color',[0 0.431372549019608 0.0862745098039216]);

% Create errorbar
errorbar(flow_rate_30_6, amplitude_30_6, error_30_6,'DisplayName','[SPA]_0 = 30.6 mM','MarkerSize',8,...
    'MarkerFaceColor',[0.949019607843137 0.545098039215686 0.0196078431372549],...
    'MarkerEdgeColor',[0.929411764705882 0.596078431372549 0.0549019607843137],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.247058823529412 0.0235294117647059 0.290196078431373]);

% Create ylabel
ylabel('Amplitude (mm)');

% Create xlabel
xlabel('Flow rate (\muL min^{-1})');

% Uncomment the following line to preserve the X-limits of the axes
xlim(gca,[0 4.2]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(gca,[-0.2 5]);
box(gca,'on');
hold(gca,'off');
% Set the remaining axes properties
set(gca,'FontSize',12,'TickLength',[0.025 0.025]);
% Create legend
legend1 = legend(gca,'show');
set(legend1,...
    'Position',[0.131514782652916 0.676224578428454 0.307142850703425 0.251190469094685],...
    'FontWeight','bold',...
    'EdgeColor','none',...
    'Color','none');

