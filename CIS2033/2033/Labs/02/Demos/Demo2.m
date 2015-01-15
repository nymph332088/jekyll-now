%% Ex 1: Plot the PMF of a binomial distribution by varying p;
% N = 100;
% p = {0.1, 0.5, 0.9}
    N = 100;
    X = 1:100;
    P = [0.1, 0.5, 0.9];
    Y = zeros(100,3);
    linestyle = cellstr(['-r'; '-b'; '-k'; '-g';'-m']);
    linestyle2 = cellstr(['.r'; '.b'; '.k'; '.g';'.m']);

    fig1 = figure;
    ah = axes('Fontsize', 15);
    for i=1:3   
        Y(:,i) = binopdf(X,N,P(1,i));
        %plot(X, Y(:,i), linestyle2{i,1}, 'linewidth', 3);
        scatter(X, Y(:,i), linestyle2{i,1}, 'linewidth', 3);               
        hold on;
    end

    xlim([0, 110]);
    ylim([0, 0.15]);
    title('The PMF of a binomial distribution');
    xlabel('X');
    ylabel('p_X');
    legend(ah,'p=0.1','p=0.5', 'p=0.9','Location','SouthEast');
    legend(ah,'boxoff')
    saveas(fig1, 'D2E1.fig');
    saveas(fig1, 'D2E1.eps', 'epsc');


%% Ex 2: Plot the CDF of a binomial distribution by varying the value for p; 
    N = 100;
    X = 1:100;
    P = [0.1, 0.5, 0.9];
    Y = zeros(100,3);
    linestyle = cellstr(['-r'; '-b'; '-k'; '-g';'-m']);

    fig2 = figure;
    ah = axes('Fontsize', 15);
    for i=1:3   
        Y(:,i) = binocdf(X,N,P(1,i));
        stairs(X, Y(:,i), linestyle{i,1}, 'linewidth', 3);
        hold on;
    end

    xlim([0, 110]);
    ylim([0, 1.0]);
    title('The CDF of a binomial distribution');
    xlabel('X');
    ylabel('Fx');
    legend(ah,'p=0.1','p=0.5', 'p=0.9','Location','SouthEast');
    legend(ah,'boxoff')
    saveas(fig2, 'D2E2.fig');
    saveas(fig2, 'D2E2.eps', 'epsc');

 
%% Ex 3: Plot the PMF of a geometric distribution by varying p;
% N = 100;
% p = {0.3, 0.5, 0.7}
    N = 100;
    X = 1:100;
    P = [0.1, 0.5, 0.9];
    Y = zeros(100,3);
    linestyle = cellstr(['-.r'; '-.b'; '-.k'; '-.g';'-.m']);

    fig3 = figure;
    ah = axes('Fontsize', 15);
    for i=1:3   
        Y(:,i) = geopdf(X,P(1,i));
        %plot(X, Y(:,i), linestyle2{i,1}, 'linewidth', 3);
        scatter(X, Y(:,i), linestyle2{i,1}, 'linewidth', 3);        
        hold on;
    end

    xlim([0, 110]);
    ylim([0, 0.25]);
    title('The PMF of a geometric distribution');
    xlabel('X');
    ylabel('p_X');
    legend(ah,'p=0.1','p=0.5', 'p=0.9','Location','SouthEast');
    legend(ah,'boxoff')
    saveas(fig3, 'D2E3.fig');
    saveas(fig3, 'D2E3.eps', 'epsc');


%% Task4: Plot the CDF of a geometric distribution by varying the value for p; 
    N = 100;
    X = 1:100;
    P = [0.3, 0.5, 0.7];
    Y = zeros(100,3);
    linestyle = cellstr(['-r'; '-b'; '-k'; '-g';'-m']);

    fig4 = figure;
    ah = axes('Fontsize', 15);
    for i=1:3   
        Y(:,i) = geocdf(X,P(1,i));
        stairs(X, Y(:,i), linestyle{i,1}, 'linewidth', 3);
        hold on;
    end

    xlim([0, 110]);
    ylim([0.5, 1.03]);
    title('The CDF of a geometric distribution');
    xlabel('X');
    ylabel('Fx');
    legend(ah,'p=0.1','p=0.5', 'p=0.9','Location','SouthEast');
    legend(ah,'boxoff')
    saveas(fig4, 'D2E4.fig');
    saveas(fig4, 'D2E4.eps', 'epsc');
    