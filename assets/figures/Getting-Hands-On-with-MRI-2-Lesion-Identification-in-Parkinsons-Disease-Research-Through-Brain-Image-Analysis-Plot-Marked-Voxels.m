% plot_lesion_groups.m
% Lesson 5 capstone: number of marked voxels (label 1) per manual ITK-SNAP mask,
% Parkinson's disease (PD) vs. control. Values are the measure_lesion_masks.sh
% output from one student's run of the lesson.
% Runs in MATLAB (R2016b or later) and GNU Octave (6 or later).
%
% Plot: one dot per participant, horizontal bar = group mean, whisker = +/- 1 sample SD
% (n = 3 per group; the lower whisker is truncated at 0). Counts are voxels, not mm^3.
% The two control values of 0 are saved masks in which nothing was marked.

ids    = {'PD01','PD02','PD03','CON01','CON02','CON03'};
voxels = [6528 5645 2142 0 0 464];
isPD   = logical([1 1 1 0 0 0]);

cPD  = [166 66 26]/255;    % Lesson 5 accent
cCON = [100 110 125]/255;  % neutral gray
lab  = [0.25 0.29 0.34];   % label gray

grp = {voxels(isPD), voxels(~isPD)};
mu  = cellfun(@mean, grp);
sd  = cellfun(@std,  grp);
col = {cPD, cCON};

fig = figure('Color','w','Units','pixels','Position',[100 100 820 640]);
ax  = axes('Parent',fig); hold(ax,'on');

for g = 1:2
    wx = g - 0.30;                          % SD whisker sits left of the dots
    lo = max(mu(g) - sd(g), 0); hi = mu(g) + sd(g);
    plot(ax, [wx wx], [lo hi], '-', 'Color',col{g}, 'LineWidth',2);
    plot(ax, wx + [-0.05 0.05], [hi hi], '-', 'Color',col{g}, 'LineWidth',2);
    plot(ax, wx + [-0.05 0.05], [lo lo], '-', 'Color',col{g}, 'LineWidth',2);
    plot(ax, [wx g+0.22], [mu(g) mu(g)], '-', 'Color',col{g}, 'LineWidth',4);   % mean
    v = grp{g};
    plot(ax, g + [-0.10 0 0.10], v, 'o', 'MarkerSize',12, ...
         'MarkerFaceColor',col{g}, 'MarkerEdgeColor','w', 'LineWidth',1.5);
end

% participant labels
text(0.94, 6528, 'PD01', 'FontSize',13, 'Color',lab);
text(1.04, 5645, 'PD02', 'FontSize',13, 'Color',lab);
text(1.14, 2142, 'PD03', 'FontSize',13, 'Color',lab);
text(2.14,  464, 'CON03', 'FontSize',13, 'Color',lab);
text(2.14,  -40, 'CON01, CON02', 'FontSize',13, 'Color',lab);

% mean labels
fmt = @(n) regexprep(sprintf('%d', round(n)), '(\d)(\d{3})$', '$1,$2');
text(1.25, mu(1), ['mean ' fmt(mu(1))], 'FontSize',15, 'FontWeight','bold', 'Color',cPD);
text(1.62, 1050,  ['mean ' fmt(mu(2))], 'FontSize',15, 'FontWeight','bold', 'Color',cCON);

set(ax, 'XLim',[0.55 2.6], 'YLim',[-350 7200], 'XTick',[1 2], ...
        'XTickLabel',{'Parkinson''s (n = 3)','Control (n = 3)'}, ...
        'YTick',0:1000:7000, 'YTickLabel',{'0','1,000','2,000','3,000','4,000','5,000','6,000','7,000'}, ...
        'FontSize',15, 'LineWidth',1.2, 'TickDir','out', 'TickLength',[0.008 0.008], ...
        'Box','off', 'YGrid','on', 'GridColor',[0.85 0.87 0.9], 'GridAlpha',1);
ylabel(ax, 'Marked voxels per mask (label 1)', 'FontSize',16);

print(fig, 'lesion_groups.png', '-dpng', '-r220');
print(fig, 'lesion_groups.svg', '-dsvg');
