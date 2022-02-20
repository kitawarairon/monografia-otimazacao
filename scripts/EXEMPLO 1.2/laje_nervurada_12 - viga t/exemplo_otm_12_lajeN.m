%nome do arquivo: exemplo_otm_12.m
%otimiza��o de laje maci�a
%trabalho de conclus�o de curso
%Pedro Kitawara
% ---

clc, clear, close all
% ---
% OP��ES
% ---
options = optimset('Algorithm','interior-point','Display','iter','PlotFcn','optimplotfval');

% ---
% VARI�VEIS DE PROJETO
% ---
% x1 - h em 'm'
% x2 - asx em 'cm^2'
% x3 - linha neutra referente � armadura asx

% ---
% LIMITES DE VARI�VEIS DE PROJETO
% ---
Lb = [7/100;0;0]; %limite inferior
Ub =[Inf; Inf;Inf]; %limite superior

% ---
% CHAMADA DOS DADOS DE ENTRADA
% ---
[C1,rhostell,fck,romin,gamac,C2,fyk,gamas,gamaconc... 
    ,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;

% ---
% DADOS DA GEOMETRIA DA LAJE E SE��O
% ---
dlinha = c + 0.5*di; % altura �til [m]
% 0.5 para uma armaduras
% 1.5 para duas armaduras


% ---
% CONCRETO
% ---
fcd = (fck*1000)/gamac; % [MPa] - resist�ncia a compress�o do concreto 

% ---
% A�O
% ---
fyd = fyk/gamas; % [kN/cm�] - tens�o de escoamento do a�o


% ---
% ESTIMATIVA INICIAL
% ---
x0 = [12/100; 2 ;0.04]; % CHUTE INICIAL

% ---
% CHAMADA DA ROTINA DE OTIMIZA��O
% ---
[x,FunVal,ExitFlag,Output]=... 
    fmincon('exemplo_objf_12_lajeN',x0,[],[],[],[],Lb,Ub,'exemplo_nolinear_constrains_12_lajeN',options);


% PAR�METROS PARA IMPRESS�O DOS RESUTLADOS
df = x(1) - dlinha;% [m] - altura �til
xinf = 0.259*df; % [m] - limite inferior entre os dom�nios 2 e 3
xsup = 0.45*df;  % [m] - limite superior 
hw = x(1) - hf; % [m] - altura da alma da viga
asmax = (400*bw*x(1)); % armadura m�xima [cm�]
asmin = romin*bw*x(1)*100; % armadura m�nima [cm�]

% ---
% IMPRESS�O DOS RESULTADOS
% ---
disp('-------------------------------- ')
disp('Solu��o:')
disp('-------------------------------- ')
disp(['h  (m) = ' num2str(x(1))])
disp('-------------------------------- ')
disp(['Asmin  (cm�) = ' num2str(asmin)])
disp('-------------------------------- ')
disp(['As  (cm�) = ' num2str(x(2))])
disp('-------------------------------- ')
disp(['Asmax  (cm�) = ' num2str(asmax)])
disp('-------------------------------- ')
disp(['xinf  (m) = ' num2str(xinf)])
disp('-------------------------------- ')
disp(['x  (m) = ' num2str(x(3))])
disp('-------------------------------- ')
disp(['xsup  (m) = ' num2str(xsup)])
disp('-------------------------------- ')
disp(['d  (m) = ' num2str(df)])
disp('-------------------------------- ')
disp(['hf (m) = ' num2str(hf)])
disp('-------------------------------- ')
disp(['bf (m) = ' num2str(bf)])
disp('-------------------------------- ')
disp(['bw (m) = ' num2str(bw)])
disp('-------------------------------- ')
disp(['hw (m) = ' num2str(hw)])
disp('-------------------------------- ')
disp(['ExitFlag: ' num2str(ExitFlag)])
disp('-------------------------------- ')
disp(['Custo (R$) = ' num2str(FunVal)])
disp('-------------------------------- ')




