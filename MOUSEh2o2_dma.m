function [t_highdose gsh gssg h2o2 living dma3 dma5]=MOUSEh2o2_dma


load yinitialcondition

%GSH MODEL PARAMETERS
Vplasmatotal=0.00113943;

NADPH = 50;
diffh2o2=2284581;
vh2o2other=3026;
vh2o2prod=28567;
gsh_deg=17.62;

cellnum=1.8e8;

%%%%%%%%%%%%% FUNDAMENTAL CONSTANTS
hematocrit=0.45;
BW=0.025; 
QCC=16.5;


VbloodC=0.049;
VliverC=0.055;
VkidneyC=0.017;
VlungC=0.007;         %
VurinarybladderC=0.0009;
VslowlyC=0.82;        %sum of fat and slowly perfused in Andersen et al. 1987
VrichlyC=0.09;        %sum of liver and richly perfused in Andersen et al. 1987

VcapliverC=0.31;
VtissliverC=0.69;
VcapkidneyC=0.24;
VtisskidneyC=0.76;
VcaplungC=0.5;
VtisslungC=0.5;
VcapurinarybladderC=0.03;
VtissurinarybladderC=0.97;
VcapslowlyC=0.03;  %Value for skin from Brown97
VtissslowlyC=0.97;
VcaprichlyC=0.31; %Value for liver from Brown97
VtissrichlyC=0.69;

QliverC=0.161;
QkidneyC=0.091;
QlungC=0.005;         
QurinarybladderC=0.0033;
QslowlyC=0.24;        %sum of fat and slowly perfused in Andersen et al. 1987  
QrichlyC=0.76;        %calculated 

PIdma3slowlyC=3;
PIdma3richlyC=1;
PIdma3lungC=0.5;
PIdma3kidneyC=2;
PIdma3liverC=0.25;
PIdma3urinarybladderC=0.01;

PIdma5slowlyC=0.3;
PIdma5richlyC=0.1;
PIdma5lungC=0.001;
PIdma5kidneyC=0.2;
PIdma5liverC=0.02;
PIdma5urinarybladderC=0.001;

Pdma3slowly=500;
Pdma3richly=200;
Pdma3lung=200;
Pdma3kidney=600;
Pdma3liver=100;
Pdma3urinarybladder=300;

Pdma5slowly=5;
Pdma5richly=2;
Pdma5lung=2;
Pdma5kidney=6;
Pdma5liver=1;
Pdma5urinarybladder=3;

dma3todma5liverC=0.1;
dma3todma5kidneyC=0.03;
dma3todma5urinarybladderC=0.002;
dma3todma5lungC=0.01;
dma3todma5slowlyC=2;
dma3todma5richlyC=0.02;
dma3todma5rbcC=0.04;

plasmatorbc5C=0.008;
rbctoplasma5C=0.02;
plasmatorbc3C=0.2;
rbctoplasma3C=0.03;

dma5absorpKmC=2000;
dma5reductiongutKmC=800;
dma3absorpC=1;
dma5absorpVmaxC=50;
dma5reductiongutVmaxC=120;
dma3totmaocolonC=1;
tocolonC=0.25;
dmatofecesC=0.4;
dma3tourineC=1;
dma5tourineC=1;
tmaotourineC=0.3;


%%%%%%%%%%%%% COMPUTED CONSTANTS
QCP=(1-hematocrit)*QCC*BW^0.75;
Vblood=VbloodC*BW;
Vliver=VliverC*BW;


Vcapliver=VcapliverC*Vliver;
Vtissliver=VtissliverC*Vliver;



Vkidney=VkidneyC*BW;
Vcapkidney=VcapkidneyC*Vkidney;
Vtisskidney=VtisskidneyC*Vkidney;
Vlung=VlungC*BW;
Vcaplung=VcaplungC*Vlung;
Vtisslung=VtisslungC*Vlung;
Vurinarybladder=VurinarybladderC*BW;
Vcapurinarybladder=VcapurinarybladderC*Vurinarybladder;
Vtissurinarybladder=VtissurinarybladderC*Vurinarybladder;
Vrichly=VrichlyC*BW - Vliver - Vkidney - Vlung - Vurinarybladder;
Vcaprichly=VcaprichlyC*Vrichly;
Vtissrichly=VtissrichlyC*Vrichly;
Vslowly=VslowlyC*BW - Vblood;
Vcapslowly=VcapslowlyC*Vslowly;
Vtissslowly=VtissslowlyC*Vslowly;


Qliver=QliverC*QCP;



Qkidney=QkidneyC*QCP;
Qlung=QlungC*QCP;         
Qurinarybladder=QurinarybladderC*QCP;
Qslowly=QslowlyC*QCP;        %from Fisher00 (trichloroethylene).
Qrichly=QrichlyC*QCP - Qliver -Qkidney - Qlung - Qurinarybladder;        %from Fisher00 

PIdma3slowly=PIdma3slowlyC*BW^0.75;
PIdma3richly=PIdma3richlyC*BW^0.75;
PIdma3lung=PIdma3lungC*BW^0.75;
PIdma3kidney=PIdma3kidneyC*BW^0.75;
PIdma3liver=PIdma3liverC*BW^0.75;
PIdma3urinarybladder=PIdma3urinarybladderC*BW^0.75;
PIdma5slowly=PIdma5slowlyC*BW^0.75;
PIdma5richly=PIdma5richlyC*BW^0.75;
PIdma5lung=PIdma5lungC*BW^0.75;
PIdma5kidney=PIdma5kidneyC*BW^0.75;
PIdma5liver=PIdma5liverC*BW^0.75;
PIdma5urinarybladder=PIdma5urinarybladderC*BW^0.75;

dma3todma5liver=dma3todma5liverC*BW^0.75;
dma3todma5kidney=dma3todma5kidneyC*BW^0.75;
dma3todma5urinarybladder=dma3todma5urinarybladderC*BW^0.75;
dma3todma5lung=dma3todma5lungC*BW^0.75;
dma3todma5slowly=dma3todma5slowlyC*BW^0.75;
dma3todma5richly=dma3todma5richlyC*BW^0.75;
dma3todma5rbc=dma3todma5rbcC*BW^0.75;

plasmatorbc5=plasmatorbc5C*BW^0.75;
rbctoplasma5=rbctoplasma5C*BW^0.75;
plasmatorbc3=plasmatorbc3C*BW^0.75;
rbctoplasma3=rbctoplasma3C*BW^0.75;

dma5absorpKm=dma5absorpKmC*BW;
dma5reductiongutKm=dma5reductiongutKmC*BW;
dma3absorp=dma3absorpC*BW^-0.25;
dma5absorpVmax=dma5absorpVmaxC*BW^0.75;
dma5reductiongutVmax=dma5reductiongutVmaxC*BW^0.75;
dma3totmaocolon=dma3totmaocolonC*BW^-0.25;
tocolon=tocolonC*BW^-0.25;
dmatofeces=dmatofecesC*BW^-0.25;
dma3tourine=dma3tourineC*BW^0.75;
dma5tourine=dma5tourineC*BW^0.75;
tmaotourine=tmaotourineC*BW^0.75;








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DMA 5


yinithighdose=zeros(265,1);
yinithighdose(201:265)=yinit;
LD50dose=(650*BW*1000)/75; %page 764 of "Toxicology" by Marquardt, Schaefer, and McClellan
yinithighdose(61)=LD50dose;




[t_highdose y_highdose]=ode15s(@mouseh2o2_dma,[0 24],yinithighdose);





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TABLE 4: COMPUTE PK TIME COURSES 




living=y_highdose(:,265)*100/cellnum;

h2o2=0.85*y_highdose(:,232)+0.15*y_highdose(:,221);
gsh=0.85*y_highdose(:,205)+0.15*y_highdose(:,203);
gssg=0.85*y_highdose(:,212)+0.15*y_highdose(:,230);
figure 
subplot(5,1,1)
plot(t_highdose,y_highdose(:,2),'k','Linewidth',2)
hold on
plot(t_highdose,y_highdose(:,102),'r','Linewidth',2)
xlim([0 24])
title('SPECIATED DMA 3 (RED) and DMA 5 (BLACK) IN LIVER CELLS (\muM)')
subplot(5,1,2)
plot(t_highdose,h2o2,'Linewidth',2)
xlim([0 24])
title('H2O2 IN LIVER CELLS (\muM)')
subplot(5,1,3)
plot(t_highdose,gsh,'Linewidth',2)
xlim([0 24])
title('GSH IN LIVER (\muM)')
subplot(5,1,4)
plot(t_highdose,gssg,'Linewidth',2)
xlim([0 24])
title('GSSG IN LIVER (\muM)')
subplot(5,1,5)
plot(t_highdose,y_highdose(:,265)*100/cellnum,'Linewidth',2)
xlim([0 24])
title('LIVING HEPATOCYTES')





figure
plot(t_highdose,y_highdose(:,12),'k')
hold on
plot(t_highdose,y_highdose(:,112),'r')
xlim([0 24])
title('SPECIATED KIDNEY: DMA3 (RED) AND DMA5 (BLACK)')
xlabel('Hours')
ylabel('\mu M')



figure
plot(t_highdose,y_highdose(:,22),'k')
hold on
plot(t_highdose,y_highdose(:,122),'r')
xlim([0 24])
title('SPECIATED LUNG: DMA3 (RED) AND DMA5 (BLACK)')
xlabel('Hours')
ylabel('\mu M')


figure
plot(t_highdose,y_highdose(:,32),'k')
hold on
plot(t_highdose,y_highdose(:,132),'r')
xlim([0 24])
title('SPECIATED URINARY BLADDER: DMA3 (RED) AND DMA5 (BLACK)')
xlabel('Hours')
ylabel('\mu M')


figure
plot(t_highdose,y_highdose(:,42),'k')
hold on
plot(t_highdose,y_highdose(:,142),'r')
xlim([0 24])
title('SPECIATED SLOWLY PERFUSED: DMA3 (RED) AND DMA5 (BLACK)')
xlabel('Hours')
ylabel('\mu M')




figure
plot(t_highdose,(hematocrit*y_highdose(:,72)+(1-hematocrit)*y_highdose(:,71)),'k');
hold on
plot(t_highdose,(hematocrit*y_highdose(:,172)+(1-hematocrit)*y_highdose(:,171)),'r');
xlim([0 24])
title('SPECIATED BLOOD: DMA3 (RED) AND DMA5 (BLACK)')
xlabel('Hours')
ylabel('\mu M')


%figure
%plot(t_highdose,y_highdose(:,171),'r')
%hold on
%plot(t_highdose,y_highdose(:,71),'k')
%xlim([0 24])
%title('COMPUTED PLASMA DMA3 (RED) AND DMA5 (BLACK) (DOSE: HIGH DOSE DMA 5)')
%figure
%plot(t_highdose,y_highdose(:,172),'r')
%hold on
%plot(t_highdose,y_highdose(:,72),'k')
%xlim([0 24])
%title('COMPUTED RBC DMA3 (RED) AND DMA5 (BLACK) (DOSE: HIGH DOSE DMA 5)')

figure
plot(t_highdose,y_highdose(:,81),'k')
hold on
plot(t_highdose,y_highdose(:,181),'r')
xlim([0 24])
xlabel('Hours')
ylabel('\mu mol')
h=title('\bf{CUMULATIVE DMA3 (RED) AND DMA5 (BLACK) EXCRETED TO URINE}','Interpreter','latex')
h.FontSize=8;


figure
plot(t_highdose,y_highdose(:,191),'r')
hold on
plot(t_highdose,y_highdose(:,91),'k')
xlim([0 24])
xlabel('Hours')
ylabel('\mu mol')
h=title('\bf{CUMULATIVE DMA3 (RED) AND DMA5 (BLACK) EXCRETED TO FECES}','Interpreter','latex')
h.FontSize=8;



%%%%%%%%%%%%%%%%%% PRINT FINAL VALUES (WHICH IS NOT NECESSARILY A STEADY STATE)
T=t_highdose;
Y=y_highdose;


Vcapliverplasma=Vcapliver*(1-hematocrit);

%AA INPUT INTO PLASMA
cysinput=cysin(T(length(T)));


%CONCENTRATIONS IN PLASMA
cystine_plasma=Y(length(T),241);
cys_plasma = Y(length(T),242);
gsh_plasma = Y(length(T),243);


%CONCENTRATIONS IN LIVER CAPILLARY PLASMA
cys_lcp = Y(length(T),244);
gsh_lcp = Y(length(T),245);


%CONCENTRATIONS IN LIVER
cys_mz  = Y(length(T),204);
glutamylcys_mz = Y(length(T),206);
gsh_cyt_mz  = Y(length(T),205);
gsh_mito_mz=Y(length(T),203);
gssg_cyt_mz = Y(length(T),212);
gssg_mito_mz=Y(length(T),230);
h2o2_cyt_mz=Y(length(T),232);
h2o2_mito_mz=Y(length(T),221);


%VELOCITIES
vlcpCYSl=Vcysin(cys_lcp);
vlGSHlcp=vGSHout_l(gsh_cyt_mz) + vGSHout_h(gsh_cyt_mz); 
vplasmaGSHdeg=gsh_deg*gsh_plasma;
vlcpCYSplasma=cys_lcp*Qliver/Vcapliverplasma;
vlcpGSHplasma=gsh_lcp*Qliver/Vcapliverplasma;
vplasmaCYSlcp=cys_plasma*Qliver/Vplasmatotal;
vplasmaGSHlcp=gsh_plasma*Qliver/Vplasmatotal;


vcysdioxy_mz=Vcysdioxygenase(cys_mz);
vgcl_mz=  VGCLholomouse(cys_mz,gsh_cyt_mz);
vgss_mz = VGSSrat(glutamylcys_mz);
vgshcyt_to_mito_mz=Vgshcyttomito(gsh_cyt_mz);
vgshmito_to_cyt_mz=Vgshmitotocyt(gsh_mito_mz);
vdiffh2o2mito_to_cyt_mz=diffh2o2*h2o2_mito_mz;
vgpx_mzcyt=VGPXcyt(gsh_cyt_mz,h2o2_cyt_mz);
vgr_mzcyt=VGRcyt(gssg_cyt_mz,NADPH);
vgpx_mzmito=VGPXmito(gsh_mito_mz,h2o2_mito_mz);
vgr_mzmito=VGRmito(gssg_mito_mz,NADPH);
vmzGSSGbile= vGSSGout(gssg_cyt_mz);
vcat_mzcyt=Vcat(h2o2_cyt_mz);

M=zeros(116,1);
M(4)=cys_mz;
M(5) = gsh_cyt_mz;
M(6) = glutamylcys_mz;
M(8) = 0;
M(10)=0;
M(11)=0;
M(12)=gssg_cyt_mz;
M(17)=vcysdioxy_mz;
M(19)=vgcl_mz;
M(20)=vgss_mz;
M(27)=vlcpCYSl;
M(28)=vlGSHlcp;
M(29)=vmzGSSGbile;
M(30)=vgpx_mzcyt;
M(31)=vgr_mzcyt;
M(33)=vplasmaGSHdeg;
M(51)=vgshcyt_to_mito_mz;
M(53)=vgpx_mzmito;
M(54)=vgr_mzmito;
M(55)=vgshmito_to_cyt_mz;
M(57)=gsh_mito_mz;
M(58)=gssg_mito_mz;
M(89)=vh2o2prod;
M(91)=h2o2_mito_mz;
M(98)=vdiffh2o2mito_to_cyt_mz;
M(99)=h2o2_cyt_mz;
M(103)=vh2o2other;
M(104)=vlcpCYSplasma;
M(105)=vlcpGSHplasma;
M(106)=vplasmaCYSlcp;
M(107)=vplasmaGSHlcp;
M(108)=cystine_plasma;
M(109)=cys_plasma;
M(110)=gsh_plasma;
M(111)=cys_lcp;
M(112)=gsh_lcp;
M(113)=vcat_mzcyt;




PrintFinalValuesMousePBPK(Vplasmatotal, Vtissliver, Vcapliverplasma, M, cysinput);


end




function dydt=mouseh2o2_dma(t,y)

%GSH MODEL PARAMETERS
Vplasmatotal=0.00113943;

NADPH = 50;
diffh2o2=2284581;
vh2o2other=3026;
vh2o2prod=28567;
gsh_deg=17.62;

cellnum=1.8e8;

%%%%%%%%%%%%% DMA-INDUCED OXIDATIVE STRESS CONSTANTS
death=0.0009;
a=2.2;
b=0.0005;
km=0.2;
n=2.5;
h2o2=0.85*y(232)+0.15*y(221);


limit=150;



if h2o2 < 1
     deathrate=0;
elseif ((h2o2 >= 1) & (h2o2 < limit))
     deathrate=death*h2o2;
else
     deathrate=death*limit;
end


%if h2o2<limit
%    deathrate=death*h2o2;
%else
%    deathrate=death*limit;
%end




%%%%%%%%%%%%% FUNDAMENTAL CONSTANTS
hematocrit=0.45;
BW=0.025; 
QCC=16.5;


VbloodC=0.049;
VliverC=0.055;
VkidneyC=0.017;
VlungC=0.007;         %
VurinarybladderC=0.0009;
VslowlyC=0.82;        %sum of fat and slowly perfused in Andersen et al. 1987
VrichlyC=0.09;        %sum of liver and richly perfused in Andersen et al. 1987

VcapliverC=0.31;
VtissliverC=0.69;
VcapkidneyC=0.24;
VtisskidneyC=0.76;
VcaplungC=0.5;
VtisslungC=0.5;
VcapurinarybladderC=0.03;
VtissurinarybladderC=0.97;
VcapslowlyC=0.03;  %Value for skin from Brown97
VtissslowlyC=0.97;
VcaprichlyC=0.31; %Value for liver from Brown97
VtissrichlyC=0.69;

QliverC=0.161;
QkidneyC=0.091;
QlungC=0.005;         
QurinarybladderC=0.0033;
QslowlyC=0.24;        %sum of fat and slowly perfused in Andersen et al. 1987  
QrichlyC=0.76;        %calculated 

PIdma3slowlyC=3;
PIdma3richlyC=1;
PIdma3lungC=0.5;
PIdma3kidneyC=2;
PIdma3liverC=0.25;
PIdma3urinarybladderC=0.01;

PIdma5slowlyC=0.3;
PIdma5richlyC=0.1;
PIdma5lungC=0.001;
PIdma5kidneyC=0.2;
PIdma5liverC=0.02;
PIdma5urinarybladderC=0.001;

Pdma3slowly=500;
Pdma3richly=200;
Pdma3lung=200;
Pdma3kidney=600;
Pdma3liver=100;
Pdma3urinarybladder=300;

Pdma5slowly=5;
Pdma5richly=2;
Pdma5lung=2;
Pdma5kidney=6;
Pdma5liver=1;
Pdma5urinarybladder=3;

dma3todma5liverC=0.1;
dma3todma5kidneyC=0.03;
dma3todma5urinarybladderC=0.002;
dma3todma5lungC=0.01;
dma3todma5slowlyC=2;
dma3todma5richlyC=0.02;
dma3todma5rbcC=0.04;

plasmatorbc5C=0.008;
rbctoplasma5C=0.02;
plasmatorbc3C=0.2;
rbctoplasma3C=0.03;

dma5absorpKmC=2000;
dma5reductiongutKmC=800;
dma3absorpC=1;
dma5absorpVmaxC=50;
dma5reductiongutVmaxC=120;
dma3totmaocolonC=1;
tocolonC=0.25;
dmatofecesC=0.4;
dma3tourineC=1;
dma5tourineC=1;
tmaotourineC=0.3;


%%%%%%%%%%%%% COMPUTED CONSTANTS

QCP=(1-hematocrit)*QCC*BW^0.75;
Vblood=VbloodC*BW;
Vliver=VliverC*BW;
Vcapliver=VcapliverC*Vliver;
Vtissliver=VtissliverC*Vliver;
Vkidney=VkidneyC*BW;
Vcapkidney=VcapkidneyC*Vkidney;
Vtisskidney=VtisskidneyC*Vkidney;
Vlung=VlungC*BW;
Vcaplung=VcaplungC*Vlung;
Vtisslung=VtisslungC*Vlung;
Vurinarybladder=VurinarybladderC*BW;
Vcapurinarybladder=VcapurinarybladderC*Vurinarybladder;
Vtissurinarybladder=VtissurinarybladderC*Vurinarybladder;
Vrichly=VrichlyC*BW - Vliver - Vkidney - Vlung - Vurinarybladder;
Vcaprichly=VcaprichlyC*Vrichly;
Vtissrichly=VtissrichlyC*Vrichly;
Vslowly=VslowlyC*BW - Vblood;
Vcapslowly=VcapslowlyC*Vslowly;
Vtissslowly=VtissslowlyC*Vslowly;



Qliver=QliverC*QCP;
Qkidney=QkidneyC*QCP;
Qlung=QlungC*QCP;         
Qurinarybladder=QurinarybladderC*QCP;
Qslowly=QslowlyC*QCP;        %from Fisher00 (trichloroethylene).
Qrichly=QrichlyC*QCP - Qliver -Qkidney - Qlung - Qurinarybladder;        %from Fisher00 

PIdma3slowly=PIdma3slowlyC*BW^0.75;
PIdma3richly=PIdma3richlyC*BW^0.75;
PIdma3lung=PIdma3lungC*BW^0.75;
PIdma3kidney=PIdma3kidneyC*BW^0.75;
PIdma3liver=PIdma3liverC*BW^0.75;
PIdma3urinarybladder=PIdma3urinarybladderC*BW^0.75;
PIdma5slowly=PIdma5slowlyC*BW^0.75;
PIdma5richly=PIdma5richlyC*BW^0.75;
PIdma5lung=PIdma5lungC*BW^0.75;
PIdma5kidney=PIdma5kidneyC*BW^0.75;
PIdma5liver=PIdma5liverC*BW^0.75;
PIdma5urinarybladder=PIdma5urinarybladderC*BW^0.75;

dma3todma5liver=dma3todma5liverC*BW^0.75;
dma3todma5kidney=dma3todma5kidneyC*BW^0.75;
dma3todma5urinarybladder=dma3todma5urinarybladderC*BW^0.75;
dma3todma5lung=dma3todma5lungC*BW^0.75;
dma3todma5slowly=dma3todma5slowlyC*BW^0.75;
dma3todma5richly=dma3todma5richlyC*BW^0.75;
dma3todma5rbc=dma3todma5rbcC*BW^0.75;

plasmatorbc5=plasmatorbc5C*BW^0.75;
rbctoplasma5=rbctoplasma5C*BW^0.75;
plasmatorbc3=plasmatorbc3C*BW^0.75;
rbctoplasma3=rbctoplasma3C*BW^0.75;

dma5absorpKm=dma5absorpKmC*BW;
dma5reductiongutKm=dma5reductiongutKmC*BW;
dma3absorp=dma3absorpC*BW^-0.25;
dma5absorpVmax=dma5absorpVmaxC*BW^0.75;
dma5reductiongutVmax=dma5reductiongutVmaxC*BW^0.75;
dma3totmaocolon=dma3totmaocolonC*BW^-0.25;
tocolon=tocolonC*BW^-0.25;
dmatofeces=dmatofecesC*BW^-0.25;
dma3tourine=dma3tourineC*BW^0.75;
dma5tourine=dma5tourineC*BW^0.75;
tmaotourine=tmaotourineC*BW^0.75;




%%%%%%%%%% DEFINE STATE VARIABLE
dma5capliver=y(1);
dma5tissliver=y(2);

dma5capkidney=y(11);
dma5tisskidney=y(12);

dma5caplung=y(21);
dma5tisslung=y(22);

dma5capurinarybladder=y(31);
dma5tissurinarybladder=y(32);

dma5capslowly=y(41);
dma5tissslowly=y(42);

dma5caprichly=y(51);
dma5tissrichly=y(52);

dma5gutlumen=y(61);

dma5plasma=y(71);
dma5rbc=y(72);
tmaoplasma=y(73);

dma5urine=y(81);
tmaourine=y(82);

dma5feces=y(91);
dma5colon=y(93);

dma3capliver=y(101);
dma3tissliver=y(102);

dma3capkidney=y(111);
dma3tisskidney=y(112);

dma3caplung=y(121);
dma3tisslung=y(122);

dma3capurinarybladder=y(131);
dma3tissurinarybladder=y(132);

dma3capslowly=y(141);
dma3tissslowly=y(142);

dma3caprichly=y(151);
dma3tissrichly=y(152);

dma3gutlumen=y(161);

dma3plasma=y(171);
dma3rbc=y(172);

dma3urine=y(181);

dma3feces=y(191);
dma3colon=y(193);



%%%%%%%%%% DEFINE DIFFERENTIAL EQUATION
dma5capliverflux=    (dma5absorpVmax*(dma5gutlumen/(dma5gutlumen+dma5absorpKm))+dma5absorpVmax*(dma5colon/(dma5colon+dma5absorpKm)) +(dma5plasma-dma5capliver)*Qliver-PIdma5liver*(dma5capliver-dma5tissliver/Pdma5liver))/((1-hematocrit)*Vcapliver);
dma5tissliverflux=   (dma3todma5liver*dma3tissliver+PIdma5liver*(dma5capliver-dma5tissliver/Pdma5liver))/Vtissliver;
dma3capliverflux=    (dma3absorp*dma3gutlumen+dma3absorp*dma3colon+(dma3plasma-dma3capliver)*Qliver-PIdma3liver*(dma3capliver-dma3tissliver/Pdma3liver))/((1-hematocrit)*Vcapliver);
dma3tissliverflux=   (PIdma3liver*(dma3capliver-dma3tissliver/Pdma3liver)-dma3todma5liver*dma3tissliver)/Vtissliver;

dma5capkidneyflux=    ((dma5plasma-dma5capkidney)*Qkidney-PIdma5kidney*(dma5capkidney-dma5tisskidney/Pdma5kidney)-dma5tourine*dma5capkidney)/((1-hematocrit)*Vcapkidney);
dma5tisskidneyflux=   (dma3todma5kidney*dma3tisskidney+PIdma5kidney*(dma5capkidney-dma5tisskidney/Pdma5kidney))/Vtisskidney;
dma3capkidneyflux=    ((dma3plasma-dma3capkidney)*Qkidney-PIdma3kidney*(dma3capkidney-dma3tisskidney/Pdma3kidney)-dma3tourine*dma3capkidney)/((1-hematocrit)*Vcapkidney);
dma3tisskidneyflux=   (-dma3todma5kidney*dma3tisskidney+PIdma3kidney*(dma3capkidney-dma3tisskidney/Pdma3kidney))/Vtisskidney;

dma5caplungflux=    ((dma5plasma-dma5caplung)*Qlung-PIdma5lung*(dma5caplung-dma5tisslung/Pdma5lung))/((1-hematocrit)*Vcaplung);
dma5tisslungflux=   (dma3todma5lung*dma3tisslung+PIdma5lung*(dma5caplung-dma5tisslung/Pdma5lung))/Vtisslung;
dma3caplungflux=    ((dma3plasma-dma3caplung)*Qlung-PIdma3lung*(dma3caplung-dma3tisslung/Pdma3lung))/((1-hematocrit)*Vcaplung);
dma3tisslungflux=   (-dma3todma5lung*dma3tisslung+PIdma3lung*(dma3caplung-dma3tisslung/Pdma3lung))/Vtisslung;

dma5capurinarybladderflux=    ((dma5plasma-dma5capurinarybladder)*Qurinarybladder-PIdma5urinarybladder*(dma5capurinarybladder-dma5tissurinarybladder/Pdma5urinarybladder))/((1-hematocrit)*Vcapurinarybladder);
dma5tissurinarybladderflux=   (dma3todma5urinarybladder*dma3tissurinarybladder+PIdma5urinarybladder*(dma5capurinarybladder-dma5tissurinarybladder/Pdma5urinarybladder))/Vtissurinarybladder;
dma3capurinarybladderflux=    ((dma3plasma-dma3capurinarybladder)*Qurinarybladder-PIdma3urinarybladder*(dma3capurinarybladder-dma3tissurinarybladder/Pdma3urinarybladder))/((1-hematocrit)*Vcapurinarybladder);
dma3tissurinarybladderflux=   (-dma3todma5urinarybladder*dma3tissurinarybladder+PIdma3urinarybladder*(dma3capurinarybladder-dma3tissurinarybladder/Pdma3urinarybladder))/Vtissurinarybladder;

dma5capslowlyflux=    ((dma5plasma-dma5capslowly)*Qslowly-PIdma5slowly*(dma5capslowly-dma5tissslowly/Pdma5slowly))/((1-hematocrit)*Vcapslowly);
dma5tissslowlyflux=   (dma3todma5slowly*dma3tissslowly+PIdma5slowly*(dma5capslowly-dma5tissslowly/Pdma5slowly))/Vtissslowly;
dma3capslowlyflux=    ((dma3plasma-dma3capslowly)*Qslowly-PIdma3slowly*(dma3capslowly-dma3tissslowly/Pdma3slowly))/((1-hematocrit)*Vcapslowly);
dma3tissslowlyflux=   (-dma3todma5slowly*dma3tissslowly+PIdma3slowly*(dma3capslowly-dma3tissslowly/Pdma3slowly))/Vtissslowly;

dma5caprichlyflux=    ((dma5plasma-dma5caprichly)*Qrichly-PIdma5richly*(dma5caprichly-dma5tissrichly/Pdma5richly))/((1-hematocrit)*Vcaprichly);
dma5tissrichlyflux=   (dma3todma5richly*dma3tissrichly+PIdma5richly*(dma5caprichly-dma5tissrichly/Pdma5richly))/Vtissrichly;
dma3caprichlyflux=    ((dma3plasma-dma3caprichly)*Qrichly-PIdma3richly*(dma3caprichly-dma3tissrichly/Pdma3richly))/((1-hematocrit)*Vcaprichly);
dma3tissrichlyflux=   (-dma3todma5richly*dma3tissrichly+PIdma3richly*(dma3caprichly-dma3tissrichly/Pdma3richly))/Vtissrichly;

dma5gutlumenflux=  -dma5absorpVmax*(dma5gutlumen/(dma5gutlumen+dma5absorpKm))-tocolon*dma5gutlumen-dma5reductiongutVmax*(dma5gutlumen/(dma5gutlumen+dma5reductiongutKm));
dma3gutlumenflux=  -dma3absorp*dma3gutlumen+dma5reductiongutVmax*(dma5gutlumen/(dma5gutlumen+dma5reductiongutKm))-tocolon*dma3gutlumen;

dma5plasmaflux=(-plasmatorbc5*dma5plasma + rbctoplasma5*dma5rbc + Qliver*dma5capliver + Qkidney*dma5capkidney + Qlung*dma5caplung +Qurinarybladder*dma5capurinarybladder + Qslowly*dma5capslowly + Qrichly*dma5caprichly -dma5plasma*QCP)/(Vblood*(1-hematocrit));
dma5rbcflux= (dma3todma5rbc*dma3rbc+plasmatorbc5*dma5plasma - rbctoplasma5*dma5rbc)/(Vblood*hematocrit);
tmaoplasmaflux= ( dma3totmaocolon*dma3colon -tmaotourine*tmaoplasma)/(Vblood*(1-hematocrit));
dma3plasmaflux=(-plasmatorbc3*dma3plasma + rbctoplasma3*dma3rbc+ Qliver*dma3capliver + Qkidney*dma3capkidney + Qlung*dma3caplung +Qurinarybladder*dma3capurinarybladder + Qslowly*dma3capslowly + Qrichly*dma3caprichly -dma3plasma*QCP)/(Vblood*(1-hematocrit));
dma3rbcflux= (-rbctoplasma3*dma3rbc + plasmatorbc3*dma3plasma-dma3todma5rbc*dma3rbc)/(Vblood*hematocrit);

dma5urineflux= dma5tourine*dma5capkidney;
dma3urineflux= dma3tourine*dma3capkidney;
tmaourineflux= tmaotourine*tmaoplasma;


dma5colonflux= -dma5absorpVmax*(dma5colon/(dma5colon+dma5absorpKm))+tocolon*dma5gutlumen-dmatofeces*dma5colon-dma5reductiongutVmax*(dma5colon/(dma5colon+dma5reductiongutKm));
dma5fecesflux= dmatofeces*dma5colon; 
dma3colonflux= - dma3totmaocolon*dma3colon + dma5reductiongutVmax*(dma5colon/(dma5colon+dma5reductiongutKm))-dma3absorp*dma3colon+tocolon*dma3gutlumen-dmatofeces*dma3colon;
dma3fecesflux= dmatofeces*dma3colon;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DEFINE STATE VARIABLE FLUX
fracliver=y(265)/cellnum;

dydt=zeros(265,1);
dydt(1)=dma5capliverflux;
dydt(2)=dma5tissliverflux;
dydt(3)=sin(t);

dydt(11)=dma5capkidneyflux;
dydt(12)=dma5tisskidneyflux;

dydt(21)=dma5caplungflux;
dydt(22)=dma5tisslungflux;

dydt(31)=dma5capurinarybladderflux;
dydt(32)=dma5tissurinarybladderflux;

dydt(41)=dma5capslowlyflux;
dydt(42)=dma5tissslowlyflux;

dydt(51)=dma5caprichlyflux;
dydt(52)=dma5tissrichlyflux;

dydt(61)=dma5gutlumenflux;

dydt(71)=dma5plasmaflux;
dydt(72)=dma5rbcflux;
dydt(73)=tmaoplasmaflux;

dydt(81)=dma5urineflux;
dydt(82)=tmaourineflux;

dydt(91)=dma5fecesflux;
dydt(93)=dma5colonflux;

dydt(101)=dma3capliverflux;
dydt(102)=dma3tissliverflux;

dydt(111)=dma3capkidneyflux;
dydt(112)=dma3tisskidneyflux;

dydt(121)=dma3caplungflux;
dydt(122)=dma3tisslungflux;

dydt(131)=dma3capurinarybladderflux;
dydt(132)=dma3tissurinarybladderflux;

dydt(141)=dma3capslowlyflux;
dydt(142)=dma3tissslowlyflux;

dydt(151)=dma3caprichlyflux;
dydt(152)=dma3tissrichlyflux;

dydt(161)=dma3gutlumenflux;

dydt(171)=dma3plasmaflux;
dydt(172)=dma3rbcflux;

dydt(181)=dma3urineflux;

dydt(191)=dma3fecesflux;
dydt(193)=dma3colonflux;

dydt(203)=Vgshcyttomito(y(205))*(0.85/0.15)-Vgshmitotocyt(y(203)) - 2*VGPXmito(y(203), y(221)) + 2*VGRmito(y(230), NADPH); %liver mito GSH

dydt(230)= VGPXmito(y(203),y(221)) - VGRmito(y(230), NADPH); % liver mito GSSG 

dydt(204)=((Vcapliver*(1-hematocrit))/Vtissliver)*Vcysin(y(244)) - VGCLholomouse(y(204),y(205)) + 100 - Vcysdioxygenase(y(204)); % liver cysteine. Extra 100 is input from MET cycle

dydt(205)=VGSSrat(y(206)) - 2*VGPXcyt(y(205), y(232)) + 2*VGRcyt(y(212), NADPH) - vGSHout_h(y(205)) - vGSHout_l(y(205)) - Vgshcyttomito(y(205)) + Vgshmitotocyt(y(203))*(0.15/0.85); %liver cytosolic GSH. 

dydt(206)=VGCLholomouse(y(204),y(205))/0.85 - VGSSrat(y(206)); %liver gamma-GC. 

dydt(212)=VGPXcyt(y(205),y(232)) - VGRcyt(y(212), NADPH) - vGSSGout(y(212)); % liver cytosolic GSSG

dydt(221)= vh2o2prod - diffh2o2*y(221) - VGPXmito(y(203),y(221)); %H2O2 in liver mitochondria. 

dydt(232)= (0.15/0.85)*diffh2o2*y(221) - VGPXcyt(y(205), y(232)) + vh2o2other*(1+(a*y(102)/(y(102)+km)+b*y(102)^n)) - Vcat(y(232)); %H2O2 in liver cytosol




dydt(257) = sin(100*t);

dydt(265) = - deathrate*y(265); % living hepatocytes (neglect regeneration)

dydt(241) = 100*y(242) - 100*(24/50)*y(241); %plasma cystine

dydt(242)= cysin(t) + gsh_deg*y(243) - (Qliver/Vplasmatotal)*y(242) + (Qliver/Vplasmatotal)*y(244) -2*100*y(242) + 2*100*(24/50)*y(241); % plasma cysteine

dydt(243)= (Qliver/Vplasmatotal)*y(245) - (Qliver/Vplasmatotal)*y(243) - gsh_deg*y(243); %plasma gsh

dydt(244)= (Qliver/(Vcapliver*(1-hematocrit)))*y(242) - (Qliver/(Vcapliver*(1-hematocrit)))*y(244)  - fracliver*Vcysin(y(244)); %lcp cysteine  

dydt(245)= (Vtissliver*fracliver*0.85/(Vcapliver*(1-hematocrit)))*vGSHout_h(y(205)) + (Vtissliver*fracliver*0.85/(Vcapliver*(1-hematocrit)))*vGSHout_l(y(205)) - (Qliver/(Vcapliver*(1-hematocrit)))*y(245) + (Qliver/(Vcapliver*(1-hematocrit)))*y(243); %lcp gsh

dydt=real(dydt);

end
