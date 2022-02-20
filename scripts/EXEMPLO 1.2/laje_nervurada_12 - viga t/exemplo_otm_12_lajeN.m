%nome do arquivo: exemplo_otm_12.m
%otimização de laje maciça
%trabalho de conclusão de curso
%Pedro Kitawara
% ---

clc, clear, close all
% ---
% OPÇÕES
% ---
options = optimset('Algorithm','interior-point','Display','iter','PlotFcn','optimplotfval');

% ---
% VARIÁVEIS DE PROJETO
% ---
% x1 - h em 'm'
% x2 - asx em 'cm^2'
% x3 - linha neutra referente à armadura asx

% ---
% LIMITES DE VARIÁVEIS DE PROJETO
% ---
Lb = [7/100;0;0]; %limite inferior
Ub =[Inf; Inf;Inf]; %limite superior

% ---
% CHAMADA DOS DADOS DE ENTRADA
% ---
[C1,rhostell,fck,romin,gamac,C2,fyk,gamas,gamaconc... 
    ,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;

% ---
% DADOS DA GEOMETRIA DA LAJE E SEÇÃO
% ---
dlinha = c + 0.5*di; % altura útil [m]
% 0.5 para uma armaduras
% 1.5 para duas armaduras


% ---
% CONCRETO
% ---
fcd = (fck*1000)/gamac; % [MPa] - resistência a compressão do concreto 

% ---
% AÇO
% ---
fyd = fyk/gamas; % [kN/cm²] - tensão de escoamento do aço


% ---
% ESTIMATIVA INICIAL
% ---
x0 = [12/100; 2 ;0.04]; % CHUTE INICIAL

% ---
% CHAMADA DA ROTINA DE OTIMIZAÇÃO
% ---
[x,FunVal,ExitFlag,Output]=... 
    fmincon('exemplo_objf_12_lajeN',x0,[],[],[],[],Lb,Ub,'exemplo_nolinear_constrains_12_lajeN',options);


% PARÂMETROS PARA IMPRESSÃO DOS RESUTLADOS
df = x(1) - dlinha;% [m] - altura útil
xinf = 0.259*df; % [m] - limite inferior entre os domínios 2 e 3
xsup = 0.45*df;  % [m] - limite superior 
hw = x(1) - hf; % [m] - altura da alma da viga
asmax = (400*bw*x(1)); % armadura máxima [cm²]
asmin = romin*bw*x(1)*100; % armadura mínima [cm²]

% ---
% IMPRESSÃO DOS RESULTADOS
% ---
disp('-------------------------------- ')
disp('Solução:')
disp('-------------------------------- ')
disp(['h  (m) = ' num2str(x(1))])
disp('-------------------------------- ')
disp(['Asmin  (cm²) = ' num2str(asmin)])
disp('-------------------------------- ')
disp(['As  (cm²) = ' num2str(x(2))])
disp('-------------------------------- ')
disp(['Asmax  (cm²) = ' num2str(asmax)])
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




