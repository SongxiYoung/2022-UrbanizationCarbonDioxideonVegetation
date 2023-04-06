clear all
clc
%--------------------------------------�����Է��������ʾ-----------------------------------------------
FAST = load('coeffast_leaf_canopy.txt');               %��ȡ����
sum = sum(FAST, 2)
N     = FAST(:,1)./sum; 
Cw   = FAST(:,2)./sum;
Cm   = FAST(:,3)./sum; 
Cs  = FAST(:,4)./sum; 
Cab = FAST(:,5)./sum;
LIDFa   = FAST(:,6)./sum;
LAI  = FAST(:,7)./sum; 

indices = [641:850]                                    %PLOT
area(indices,Cab,'FaceColor',[73/255 116/255 121/255]);              % deep green
hold on 
area(indices,N,'FaceColor',[185/255 156/255 181/255]);             % pink
area(indices,Cs,'FaceColor',[233/255 231/255 158/255]);             % yellow
area(indices,Cm,'FaceColor',[140/255 174/255 140/255]);            % light green
area(indices,Cw,'FaceColor',[115/255 132/255 165/255]);            % blue
area(indices,LIDFa,'FaceColor',[108/255 118/255 107/255]);             % 6c766b
area(indices,LAI,'FaceColor',[129/255 158/255 139/255]);            % 819e8b

h = area(indices,[Cab,N,Cs,Cm,Cw, LIDFa, LAI]);  
h(1).FaceColor = [73/255 116/255 121/255];
h(2).FaceColor = [185/255 156/255 181/255];
h(3).FaceColor = [233/255 231/255 158/255];
h(4).FaceColor = [140/255 174/255 140/255];
h(5).FaceColor = [115/255 132/255 165/255];
h(6).FaceColor = [108/255 118/255 107/255];
h(7).FaceColor = [129/255 158/255 139/255];


xline(685,"LineWidth", 3);
xline(740,"LineWidth", 3);
xline(760,"LineWidth", 3);

xlim([645 800])
ylim([0 1])
legend({'Cab','N','Cs','Cm','Cw','LIDFa','LAI'},'Location','northoutside','NumColumns',7)
set(gca,'FontSize',42,'FontName','Times New Roman','LineWidth',3);
xlabel(['\fontname{��������}����\fontname{Times new roman}(nm)'],'FontWeight','Bold','FontSize',48);
ylabel(['\fontname{��������}������'], 'FontWeight','Bold','FontSize',48);
