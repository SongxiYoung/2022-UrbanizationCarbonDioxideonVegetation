clear all
clc
%--------------------------------------敏感性分析结果显示-----------------------------------------------
FAST = load('coeffast_op_ph.txt');               %读取参数
sum = sum(FAST, 2)
N     = FAST(:,1)./sum; 
Cw   = FAST(:,2)./sum;
Cm   = FAST(:,3)./sum; 
Cs  = FAST(:,4)./sum; 
Cab = FAST(:,5)./sum;
m     = FAST(:,6)./sum; 
kV   = FAST(:,7)./sum;
Rdparam   = FAST(:,8)./sum; 
Vcmo  = FAST(:,9)./sum; 
kNPQs = FAST(:,10)./sum;
qLs = FAST(:,11)./sum;

indices = [641:850]                                    %PLOT
area(indices,Cab,'FaceColor',[73/255 116/255 121/255]);              % deep green
hold on 
area(indices,N,'FaceColor',[185/255 156/255 181/255]);             % pink
area(indices,Cs,'FaceColor',[233/255 231/255 158/255]);             % yellow
area(indices,Cm,'FaceColor',[140/255 174/255 140/255]);            % light green
area(indices,Cw,'FaceColor',[115/255 132/255 165/255]);            % blue
area(indices,m,'FaceColor',[168/255 123/255 102/255]);               % 
area(indices,kV,'FaceColor',[202/255 192/255 147/255]);             % 
area(indices,Rdparam,'FaceColor',[209/255 206/255 192/255]);        % 
area(indices,Vcmo,'FaceColor',[180/255 189/255 172/255]);           % 
area(indices,kNPQs,'FaceColor',[180/255 168/255 176/255]);          % 
area(indices,qLs,'FaceColor',[129/255 142/255 138/255]);            % 

h = area(indices,[Cab,N,Cs,Cm,Cw,m,kV,Rdparam,Vcmo,kNPQs,qLs]);  
h(1).FaceColor = [73/255 116/255 121/255];
h(2).FaceColor = [185/255 156/255 181/255];
h(3).FaceColor = [233/255 231/255 158/255];
h(4).FaceColor = [140/255 174/255 140/255];
h(5).FaceColor = [115/255 132/255 165/255];
h(6).FaceColor = [168/255 123/255 102/255];
h(7).FaceColor = [202/255 192/255 147/255];
h(8).FaceColor = [209/255 206/255 192/255];
h(9).FaceColor = [180/255 189/255 172/255];
h(10).FaceColor = [180/255 168/255 176/255];
h(11).FaceColor = [129/255 142/255 138/255];


xline(685,"LineWidth", 3);
xline(740,"LineWidth", 3);
xline(760,"LineWidth", 3);

xlim([645 800])
ylim([0 1])
legend({'Cab','N','Cs','Cm','Cw','m','kV','Rdparam','Vcmo','kNPQs','qLs'},'Location','northoutside','NumColumns',6)
set(gca,'FontSize',42,'FontName','Times New Roman','LineWidth',3);
xlabel(['\fontname{华文中宋}波长\fontname{Times new roman}(nm)'],'FontWeight','Bold','FontSize',48);
ylabel(['\fontname{华文中宋}敏感性'], 'FontWeight','Bold','FontSize',48);


