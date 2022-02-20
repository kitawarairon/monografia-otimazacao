%nome do arquivo: exemplo_otm_12.m
%otimiza��o de laje maci�a
%trabalho de conclus�o de curso
%Pedro Kitawara
% ---

clc, clear, close all
% ---
% OP��ES
% ---
options = optimoptions(@fmincon,'Algorithm','interior-point','Display','iter','PlotFcn','optimplotfval');

% ---
% VARI�VEIS DE PROJETO
% ---
% x1 = h em "m"
% x2 = linha neutra "m"


% ---
% LIMITES DE VARI�VEIS DE PROJETO
% ---
Lb = [8/100;0]; %limite inferior
Ub =[Inf;Inf]; %limite superior

[C1,C2,rhostell,fck,gamac,fyk,gamas,gamaconc... 
    ,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hw,q,gamaG,gamaQ] = dados_exemplo_12_N;

% ---
% DADOS DA GEOMETRIA DA LAJE E SE��O
% ---
dlinha = c + 0.5*di; %m altura �til

% ---
% �REA DE A�O
% ---
%VIGOTA TB-6545
%TABELA BELGO GRUPO ARCELOR
as = 2*(pi*di^2/4);

% ---
% CONCRETO
% ---
fcd = (fck*1000)/gamac; %MPa

% ---
% A�O
% ---
fyd = fyk/gamas; %MPa

% ---
% COEFICIENTES DA MATRIZ
% ---


% ---
% MATRIZES DE IQUALDADE LINEAR
% ---
%Aeq =[-((0.306*fcd*b)/fyd)x1 + x2]
%Aeq =[a1]; %MATRIZ  ENTRADA
%beq = [a2]; %VETOR DE ENTRADA

% ---
% ESTIMATIVA INICIAL
% ---
x0 = [6/100; 0.03];

% ---
% CHAMADA DA ROTINA DE OTIMIZA��O COM RESTRI��ES
% ---
[x,FunVal,ExitFlag,Output]=... 
    fmincon('exemplo_objf_12_lajeN',x0,[],[],[],[],Lb,Ub,'exemplo_nolinear_constrains_12_lajeN',options);



% ---
% IMPRESS�O DOS RESULTADOS
% ---
disp('Solu��o:')
disp('-------------------------------- ')
disp(['h  (m) = ' num2str(x(1))])
disp('-------------------------------- ')
%disp(['hf (m) = ' num2str(hf1)])
disp('-------------------------------- ')
disp(['bf (m) = ' num2str(hw)])
disp('-------------------------------- ')
disp(['bw (m) = ' num2str(bw)])
disp('-------------------------------- ')
disp(['ExitFlag: ' num2str(ExitFlag)])
disp('-------------------------------- ')
disp(['Custo (R$) = ' num2str(FunVal)])
disp('-------------------------------- ')
