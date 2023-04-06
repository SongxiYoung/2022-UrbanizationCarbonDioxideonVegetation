clear all
clc
%--------------------------------------敏感性分析结果显示-----------------------------------------------
FAST = load('coeffast_meteo_noRin.txt');               %读取参数
sum = sum(FAST, 2)
p     = FAST(:,1)./sum; 
u   = FAST(:,2)./sum;
Oa   = FAST(:,3)./sum; 
ea  = FAST(:,4)./sum; 
Ca = FAST(:,5)./sum;
Ta = FAST(:,6)./sum;
Rli = FAST(:,7)./sum;


indices = [641:850]                                    %PLOT
area(indices,p,'FaceColor',[33/255 74/255 92/255]);               % 214a5c
hold on 
area(indices,u,'FaceColor',[73/255 92/255 102/255]);             % 495c66
area(indices,Oa,'FaceColor',[16/255 50/255 55/255]);        % 103237
area(indices,ea,'FaceColor',[185/255 189/255 188/255]);           % b9bdbc
area(indices,Ca,'FaceColor',[143/255 153/255 173/255]);          % 8f99ad
area(indices,Ta,'FaceColor',[148/255 80/255 55/255]);            % 282725
area(indices,Rli,'FaceColor',[145/255 142/255 139/255]);            % 918e8b


h = area(indices,[p,u,Oa,ea,Ca,Ta, Rli]);  
h(1).FaceColor = [33/255 74/255 92/255];
h(2).FaceColor = [73/255 92/255 102/255];
h(3).FaceColor = [16/255 50/255 55/255];
h(4).FaceColor = [185/255 189/255 188/255];
h(5).FaceColor = [143/255 153/255 173/255];
h(6).FaceColor = [148/255 80/255 55/255];
h(7).FaceColor = [145/255 142/255 139/255];


xline(685,"LineWidth", 3);
xline(740,"LineWidth", 3);
xline(760,"LineWidth", 3);


xlim([645 800])
ylim([0 1])
legend({'p','u','Oa','ea','Ca','Ta','Rli'},'Location','northoutside','NumColumns',4)
set(gca,'FontSize',42,'FontName','Times New Roman','LineWidth',3);
xlabel(['\fontname{华文中宋}波长\fontname{Times new roman}(nm)'],'FontWeight','Bold','FontSize',48);
ylabel(['\fontname{华文中宋}敏感性'], 'FontWeight','Bold','FontSize',48);

% saveas(gcf,'GSAT_leaf_optical.jpg')
