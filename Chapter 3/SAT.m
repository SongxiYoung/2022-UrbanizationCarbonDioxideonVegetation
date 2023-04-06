addpath GSAT
clear all 

pro = pro_Create();
% % 1 soil
% pro = pro_AddInput(pro, @()pdf_Sobol([200 5000]), 'rss');
% pro = pro_AddInput(pro, @()pdf_Sobol([0.01 0.7]), 'SMC');
% 2 leaf optical
pro = pro_AddInput(pro, @()pdf_Sobol([1 2.5]), 'N');
pro = pro_AddInput(pro, @()pdf_Sobol([0 0.1]), 'Cw');
pro = pro_AddInput(pro, @()pdf_Sobol([0 0.05]), 'Cm');
pro = pro_AddInput(pro, @()pdf_Sobol([0. 0.9]), 'Cs');
pro = pro_AddInput(pro, @()pdf_Sobol([0 80]), 'Cab');
% 3 leaf physiology(TB12-D, TB12, MD12)
pro = pro_AddInput(pro, @()pdf_Sobol([2 20]), 'm');
pro = pro_AddInput(pro, @()pdf_Sobol([0 0.8]), 'kV');
pro = pro_AddInput(pro, @()pdf_Sobol([0.001 0.03]), 'Rdparam');
pro = pro_AddInput(pro, @()pdf_Sobol([0 200]), 'Vcmo');
% 4 Leaf physiology (MD12 only)
pro = pro_AddInput(pro, @()pdf_Sobol([0 10]), 'kNPQs');
pro = pro_AddInput(pro, @()pdf_Sobol([0 1]), 'qLs');
% % 5 Aerodynamic
% pro = pro_AddInput(pro, @()pdf_Sobol([5 30]), 'rbs');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 20]), 'rwc');
% pro = pro_AddInput(pro, @()pdf_Sobol([5 20]), 'rb');
% % 6 Micrometeorologic
% pro = pro_AddInput(pro, @()pdf_Sobol([300 1090]), 'p');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 50]), 'u');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 220]), 'Oa');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 150]), 'ea');
% pro = pro_AddInput(pro, @()pdf_Sobol([50 1000]), 'Ca');
% pro = pro_AddInput(pro, @()pdf_Sobol([-10 50]), 'Ta');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 1400]), 'Rin');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 400]), 'Rli');
% % 7 Canopy
% pro = pro_AddInput(pro, @()pdf_Sobol([0.01 0.1]), 'lw');
% pro = pro_AddInput(pro, @()pdf_Sobol([-1 1]), 'LIDFa');
% pro = pro_AddInput(pro, @()pdf_Sobol([-1 1]), 'LIDFb');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 7]), 'LAI');
% pro = pro_AddInput(pro, @()pdf_Sobol([0.1 2]), 'hc');
% % 8 Geometry
% pro = pro_AddInput(pro, @()pdf_Sobol([0 10]), 'VZA');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 60]), 'SZA');
% pro = pro_AddInput(pro, @()pdf_Sobol([0 180]), 'RAA');


coeffast = [];
coefsobol = [];
for k = 1:211
    pro = pro_SetModel(pro, @(x)SCOPE_GSAT(x , k ), 'model');
    pro.N = 100;
    pro = GSA_Init_MultiOut_MultiSI(pro); 
%  [S1 eS1 pro] = GSA_GetSy_MultiOut_MultiSI(pro, {1});
%  [S2 eS2 pro] = GSA_GetSy_MultiOut_MultiSI(pro, {2});
%  [S3 eS3 pro] = GSA_GetSy_MultiOut_MultiSI(pro, {3});
%  [S4 eS4 pro] = GSA_GetSy_MultiOut_MultiSI(pro, {4});
%  [S5 eS5 pro] = GSA_GetSy_MultiOut_MultiSI(pro, {5});
%  [S6 eS6 pro] = GSA_GetSy_MultiOut_MultiSI(pro, {6});
%  [S7 eS7 pro] = GSA_GetSy_MultiOut_MultiSI(pro, {7});
%  [Stotall, eStotall, pro] = GSA_GetTotalSy_MultiOut_MultiSI(pro, {1,2,3,4,5,6,7});
    
    Sfast = GSA_FAST_GetSi_MultiOut(pro);
    coeffast = [coeffast;Sfast(1,:)]
% coefsobol = [coefsobol;S1(2),S2(2),S3(2),S4(2),S5(2),S6(2),S7(2),Stotall(2)]
end

dlmwrite('coeffast_op_ph.txt',coeffast,'delimiter','\t','precision',5)
