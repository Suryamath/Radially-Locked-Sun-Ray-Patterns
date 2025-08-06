clear all
close all
clc
%%
% Define the loop parameters
Q = [160];                                 % Parameter values for set 1
                  % Number of iterations for parameter set 2
tvec=linspace(100,10000,100);
formatted_tvec = zeros(size(tvec));
% Format each number individually and store in the array
for i = 1:numel(tvec)
    formatted_tvec(i) = str2double(num2str(tvec(i), '%.1f'));
end

load("dataA_time.mat")
%%
%new mesh
M = 2048;
N = 512;
R1 = 0.5 ; % inner radius 
R2 = 700 ;  % outer radius
nR = linspace(R1,R2,M) ;
nT = linspace(0,2*pi,N) ;
[R, T] = meshgrid(nR,nT) ;

% Convert grid to cartesian coordintes
X = R.*cos(T); 
Y = R.*sin(T);
[m,n]=size(X);


%%
tp=[200 1000 5000 10000];
for k=1:length(tp)
time(k)= find(tvec == tp(k));
end

%% different time A 
for i = 1        %index for Q
    for j = 1    %index for delta
        for k=1:length(tp)
zMin(j,i,k) = min(min(dataA_160_time{j,i,k}));   %A_p{delta,Q,time}
zMax(j,i,k)=  max(max(dataA_160_time{j,i,k}));   %A_p{delta,Q,time}
        end
    end
end

cLow=min(min(min(zMin(:,:,:))));
cHigh=max(max(max(zMax(:,:,:))));
figure
set(gcf,'color','w') ;

box on
hold on
cmap = colormap('Rainbow');
for i = 1
    for j = 1
        for k=1:length(tp)
        h1=subplot(1,length(tp),(i-1)+k);
        pos1=get(h1,'Position');
        new_pos1 = pos1 +[0 0 0.045 -0.2];
        set(h1, 'Position',new_pos1 );
        surf(X,Y, dataA_160_time{j,i,k},'EdgeColor','none'); %data{delta,Q}
        shading interp;  % Smooth shading
        axis tight;  % Tighten the axes limits

        axis equal
        clim([cLow,cHigh])
        clear h1 pos1 new_pos1
% Remove the X and Y labels
xlabel('');
ylabel('');

% Remove the X and Y ticks
set(gca, 'XTick', []);

set(gca, 'XColor', 'none');
set(gca, 'YColor', 'none');
set(gca, 'ZColor', 'none');

grid off;
box off;

view(2);

ti=title(sprintf('$t=%d$', tvec(time(k))), ...
       'Interpreter', 'latex', 'HorizontalAlignment', ...
       'center');
        end
    end
end

figureWidth=650;
figureHeight=100;
% Adjust the spacing between subplots
spacing = 0.15;  % Adjust the spacing as desired
% set(gcf, 'Position', get(gcf, 'Position') + [0, 0, 0, spacing * (8 - 1)]);
set(gcf, 'Position', get(gcf, 'Position') + [0, 0, figureWidth-10*spacing, figureHeight]);

% Create a colorbar below the entire figure
c = colorbar('Location', 'southoutside');


% Adjust the position of the colorbar
colorbarPosition = get(c, 'Position');
set(c, 'Position', [colorbarPosition(1)-3.15*spacing, colorbarPosition(2)-0.8*spacing, ...
    colorbarPosition(3)+2*spacing, colorbarPosition(4)+.1*spacing]);
set(c, 'Position', [0.305337194869672 0.0797435897435921 0.501124327678941 0.0298717948717948],'FontSize',12);

set(c, 'Ticks',[0 0.1 0.2 0.4 0.6 0.8 1 cHigh],...
    'TickLabels',{'0','0.1','0.2','0.4','0.6','0.8','1',num2str(cHigh)});

exportgraphics(gcf,'Q160_spacetime.jpg','Resolution',600) % change for a different Q
