clear all
clc
%--------------------------------------敏感性分析结果显示-----------------------------------------------
FAST = load('coeffast_26.txt');               %读取参数
sum = sum(FAST, 2)
N     = FAST(:,1)./sum; 
Cw   = FAST(:,2)./sum;
Cm   = FAST(:,3)./sum; 
Cs  = FAST(:,4)./sum; 
Cab = FAST(:,5)./sum;
p     = FAST(:,6)./sum; 
u   = FAST(:,7)./sum;
Oa   = FAST(:,8)./sum; 
ea  = FAST(:,9)./sum; 
Ca = FAST(:,10)./sum;
Ta = FAST(:,11)./sum;
Rin = FAST(:,12)./sum;
Rli = FAST(:,13)./sum;

indices = [641:850]                                    %PLOT
area(indices,Cab,'FaceColor',[73/255 116/255 121/255]);              % deep green
hold on 
area(indices,N,'FaceColor',[185/255 156/255 181/255]);             % pink
area(indices,Cs,'FaceColor',[233/255 231/255 158/255]);             % yellow
area(indices,Cm,'FaceColor',[140/255 174/255 140/255]);            % light green
area(indices,Cw,'FaceColor',[115/255 132/255 165/255]);            % blue
area(indices,p,'FaceColor',[33/255 74/255 92/255]);               % 214a5c
area(indices,u,'FaceColor',[73/255 92/255 102/255]);             % 495c66
area(indices,Oa,'FaceColor',[16/255 50/255 55/255]);        % 103237
area(indices,ea,'FaceColor',[185/255 189/255 188/255]);           % b9bdbc
area(indices,Ca,'FaceColor',[143/255 153/255 173/255]);          % 8f99ad
area(indices,Ta,'FaceColor',[40/255 39/255 37/255]);            % 282725
area(indices,Rin,'FaceColor',[103/255 117/255 137/255]);          % 677589
area(indices,Rli,'FaceColor',[145/255 142/255 139/255]);            % 918e8b

h = area(indices,[Cab,N,Cs,Cm,Cw,p,u,Oa,ea,Ca,Ta, Rin,Rli]);  
h(1).FaceColor = [73/255 116/255 121/255];
h(2).FaceColor = [185/255 156/255 181/255];
h(3).FaceColor = [233/255 231/255 158/255];
h(4).FaceColor = [140/255 174/255 140/255];
h(5).FaceColor = [115/255 132/255 165/255];
h(6).FaceColor = [33/255 74/255 92/255];
h(7).FaceColor = [73/255 92/255 102/255];
h(8).FaceColor = [16/255 50/255 55/255];
h(9).FaceColor = [185/255 189/255 188/255];
h(10).FaceColor = [143/255 153/255 173/255];
h(11).FaceColor = [40/255 39/255 37/255];
h(12).FaceColor = [103/255 117/255 137/255];
h(13).FaceColor = [145/255 142/255 139/255];


xline(685,"LineWidth", 3);
xline(740,"LineWidth", 3);
xline(760,"LineWidth", 3);

xlim([645 800])
ylim([0 1])
legend({'Cab','N','Cs','Cm','Cw','p','u','Oa','ea','Ca','Ta','Rin','Rli'},'Location','northoutside','NumColumns',7)
set(gca,'FontSize',42,'FontName','Times New Roman','LineWidth',3);
xlabel(['\fontname{华文中宋}波长\fontname{Times new roman}(nm)'],'FontWeight','Bold','FontSize',48);
ylabel(['\fontname{华文中宋}敏感性'], 'FontWeight','Bold','FontSize',48);

