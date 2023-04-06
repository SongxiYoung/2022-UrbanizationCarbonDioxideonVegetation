clear all
clc
%--------------------------------------敏感性分析结果显示-----------------------------------------------
FAST = load('coeffast_clip rin.txt');               %读取参数
sum = sum(FAST, 2)
Cm   = FAST(:,1)./sum; 
Cs  = FAST(:,2)./sum; 
Cab = FAST(:,3)./sum;
Vcmo  = FAST(:,4)./sum;  
kNPQs = FAST(:,5)./sum;
qLs = FAST(:,6)./sum;
Rin = FAST(:,7)./sum;
lw     = FAST(:,8)./sum; 
LIDFa   = FAST(:,9)./sum;
LIDFb   = FAST(:,10)./sum; 
LAI  = FAST(:,11)./sum; 
hc = FAST(:,12)./sum;

indices = [641:850]                                    %PLOT
area(indices,Cab,'FaceColor',[73/255 116/255 121/255]);              % deep green
hold on 
area(indices,Cs,'FaceColor',[233/255 231/255 158/255]);             % yellow
area(indices,Cm,'FaceColor',[140/255 174/255 140/255]);            % light green
area(indices,Vcmo,'FaceColor',[180/255 189/255 172/255]);           % 
area(indices,kNPQs,'FaceColor',[180/255 168/255 176/255]);          % 
area(indices,qLs,'FaceColor',[129/255 142/255 138/255]);            % 
area(indices,Rin,'FaceColor',[103/255 117/255 137/255]);          % 677589
area(indices,lw,'FaceColor',[126/255 142/255 102/255]);              %  7e8e66
area(indices,hc,'FaceColor',[204/255 168/255 158/255]);            % cca89e
area(indices,LIDFa,'FaceColor',[108/255 118/255 107/255]);             % 6c766b
area(indices,LIDFb,'FaceColor',[100/255 48/255 40/255]);             % 643028
area(indices,LAI,'FaceColor',[129/255 158/255 139/255]);            % 819e8b

h = area(indices,[Cab,Cs,Cm,Vcmo,kNPQs, qLs, Rin,lw,hc,LIDFa,LIDFb,LAI]);  
h(1).FaceColor = [73/255 116/255 121/255];
h(2).FaceColor = [233/255 231/255 158/255];
h(3).FaceColor = [140/255 174/255 140/255];
h(4).FaceColor = [180/255 189/255 172/255];
h(5).FaceColor = [180/255 168/255 176/255];
h(6).FaceColor = [129/255 142/255 138/255];
h(7).FaceColor = [103/255 117/255 137/255];
h(8).FaceColor = [126/255 142/255 102/255];
h(9).FaceColor = [204/255 168/255 158/255];
h(10).FaceColor = [108/255 118/255 107/255];
h(11).FaceColor = [100/255 48/255 40/255];
h(12).FaceColor = [129/255 158/255 139/255];


xline(685,"LineWidth", 3);
xline(740,"LineWidth", 3);
xline(760,"LineWidth", 3);

xlim([645 800])
ylim([0 1])
legend({'Cab','Cs','Cm','Vcmo','kNPQs','qLs','Rin','lw','hc','LIDFa','LIDFb','LAI'},'Location','northoutside','NumColumns',6)
set(gca,'FontSize',42,'FontName','Times New Roman','LineWidth',3);
xlabel(['\fontname{华文中宋}波长\fontname{Times new roman}(nm)'],'FontWeight','Bold','FontSize',48);
ylabel(['\fontname{华文中宋}敏感性'], 'FontWeight','Bold','FontSize',48);
