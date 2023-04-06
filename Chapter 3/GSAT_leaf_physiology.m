clear all
clc
%--------------------------------------敏感性分析结果显示-----------------------------------------------
FAST = load('coeffast_physiology.txt');               %读取参数
sum = sum(FAST, 2)
m     = FAST(:,1)./sum; 
kV   = FAST(:,2)./sum;
Rdparam   = FAST(:,3)./sum; 
Vcmo  = FAST(:,4)./sum; 
kNPQs = FAST(:,5)./sum;
qLs = FAST(:,6)./sum;


indices = [641:850]                                    %PLOT
area(indices,m,'FaceColor',[168/255 123/255 102/255]);               % 
hold on 
area(indices,kV,'FaceColor',[202/255 192/255 147/255]);             % 
area(indices,Rdparam,'FaceColor',[209/255 206/255 192/255]);        % 
area(indices,Vcmo,'FaceColor',[180/255 189/255 172/255]);           % 
area(indices,kNPQs,'FaceColor',[180/255 168/255 176/255]);          % 
area(indices,qLs,'FaceColor',[129/255 142/255 138/255]);            % 


h = area(indices,[m,kV,Rdparam,Vcmo,kNPQs,qLs]);  
h(1).FaceColor = [168/255 123/255 102/255];
h(2).FaceColor = [202/255 192/255 147/255];
h(3).FaceColor = [209/255 206/255 192/255];
h(4).FaceColor = [180/255 189/255 172/255];
h(5).FaceColor = [180/255 168/255 176/255];
h(6).FaceColor = [129/255 142/255 138/255];


xline(685,"LineWidth", 3);
xline(740,"LineWidth", 3);
xline(760,"LineWidth", 3);


xlim([645 800])
ylim([0 1])
legend({'m','kV','Rdparam','Vcmo','kNPQs','qLs'},'Location','northoutside','NumColumns',6)
set(gca,'FontSize',42,'FontName','Times New Roman','LineWidth',3);
xlabel(['\fontname{华文中宋}波长\fontname{Times new roman}(nm)'],'FontWeight','Bold','FontSize',48);
ylabel(['\fontname{华文中宋}敏感性'], 'FontWeight','Bold','FontSize',48);

% xlabel('Wavelength(nm)','FontWeight','Bold','fontsize',48);% x轴名称
% ylabel('Sensitivity','FontWeight','Bold','fontsize',48);
% saveas(gcf,'GSAT_leaf_optical.jpg')
