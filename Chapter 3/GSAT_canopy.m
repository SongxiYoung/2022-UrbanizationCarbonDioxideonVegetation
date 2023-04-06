clear all
clc
%--------------------------------------敏感性分析结果显示-----------------------------------------------
FAST = load('coeffast_canopy.txt');               %读取参数
sum = sum(FAST, 2)
lw     = FAST(:,1)./sum; 
LIDFa   = FAST(:,2)./sum;
LIDFb   = FAST(:,3)./sum; 
LAI  = FAST(:,4)./sum; 
hc = FAST(:,5)./sum;

indices = [641:850]                                    %PLOT
area(indices,lw,'FaceColor',[126/255 142/255 102/255]);              %  7e8e66
hold on 
area(indices,hc,'FaceColor',[204/255 168/255 158/255]);            % cca89e
area(indices,LIDFa,'FaceColor',[108/255 118/255 107/255]);             % 6c766b
area(indices,LIDFb,'FaceColor',[100/255 48/255 40/255]);             % 643028
area(indices,LAI,'FaceColor',[129/255 158/255 139/255]);            % 819e8b


h = area(indices,[lw,hc,LIDFa,LIDFb,LAI]);  
h(1).FaceColor = [126/255 142/255 102/255];
h(2).FaceColor = [204/255 168/255 158/255];
h(3).FaceColor = [108/255 118/255 107/255];
h(4).FaceColor = [100/255 48/255 40/255];
h(5).FaceColor = [129/255 158/255 139/255];


xline(685,"LineWidth", 3);
xline(740,"LineWidth", 3);
xline(760,"LineWidth", 3);

xlim([645 800])
ylim([0 1])
legend({'lw','hc','LIDFa','LIDFb','LAI'},'Location','northoutside','NumColumns',5)
set(gca,'FontSize',42,'FontName','Times New Roman','LineWidth',3);
xlabel(['\fontname{华文中宋}波长\fontname{Times new roman}(nm)'],'FontWeight','Bold','FontSize',48);
ylabel(['\fontname{华文中宋}敏感性'], 'FontWeight','Bold','FontSize',48);
