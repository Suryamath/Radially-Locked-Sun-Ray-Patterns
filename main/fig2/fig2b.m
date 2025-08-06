clear all
close all
clc

%%
Q = [160];                                 % Parameter values for set 1
delta = [3 4 7 10];                            % Parameter values for set 2
Qsize = length(Q);                           % Number of iterations for parameter set 1
deltasize = length(delta);                   % Number of iterations for parameter set 2

tvec=linspace(100,10000,100);
formatted_tvec = zeros(size(tvec));
% Format each number individually and store in the array
for i = 1:numel(tvec)
    formatted_tvec(i) = str2double(num2str(tvec(i), '%.1f'));
end
par1=Qsize;
par2=deltasize;


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

load("dataA_Q160.mat") % change to plot for a different Q
%%
tp=[200 1000 5000 10000];
for k=1:length(tp)
time(k)= find(tvec == tp(k));
end

%% different par A or  B
for i = 1        %index for Q
    for j = 1:par2    %index for delta
        for k=1
zMin(j,i,k) = min(min(dataA{j,i}));   %A_p{delta,Q,time}
zMax(j,i,k)=  max(max(dataA{j,i}));   %A_p{delta,Q,time}
        end
    end
end
cLow=min(min(min(zMin(:,:,:))));
cHigh=max(max(max(zMax(:,:,:))));
figure
set(gcf,'color','w') ;
% axis equal
% axis tight;  % Tighten the axes limits
box on
hold on
cmap = colormap('jet');
cmap = cmap(1:150,:);

for i = 1
    for j = 1:par2
        h1=subplot(1,par2,(i-1)+j);
        pos1=get(h1,'Position');
        new_pos1 = pos1 +[0 0.0 0.045 -0.04];
        set(h1, 'Position',new_pos1 );
        surf(X(:,:),Y(:,:), dataA{j,i},'EdgeColor','none'); %data{delta,Q}
        shading interp;  % Smooth shading
        axis tight;  % Tighten the axes limits
        axis equal;
        clim([0,1.35])        
        clear h1 pos1 new_pos1
% Remove the X and Y labels
xlabel('');
ylabel('');

% Remove the X and Y ticks
set(gca, 'XTick', []);

set(gca, 'XColor', 'none');
set(gca, 'YColor', 'none');

grid off;

% Remove the box grid
box off;
% Set the viewing angle to directly above the plot
view(2);

title(sprintf('$\\delta = %d, Q=160$', delta(j)), ...
    'Interpreter', 'latex', ...
    'HorizontalAlignment', 'center', ...
    'FontSize', 14);  % change for a different Q

    end
end

figureWidth=650;
figureHeight=100;

% Adjust the spacing between subplots
spacing = 0.15;  % Adjust the spacing as desired

% set(gcf, 'Position', get(gcf, 'Position') + [0, 0, 0, spacing * (8 - 1)]);
set(gcf, 'Position', get(gcf, 'Position') + [0, 0, figureWidth-10*spacing, figureHeight + spacing * (length(par1) - 1)]);

% Create a colorbar below the entire figure
c = colorbar('Location', 'east');


% Adjust the position of the colorbar
set(c,'Position',[0.954002981429003 0.286915149058335 0.00903384107823679 0.399623312480127],...
    'TickLength',0.025,...
    'FontWeight','bold',...
    'FontSize',12);
exportgraphics(gcf,'Q160image.jpg','Resolution',600) % change for a different Q