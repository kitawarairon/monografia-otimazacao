% -----------------------------------------
% NOME DO ARQUIVO: exemplo_otm_21.m
% OTIMIZA??O PARA LAJE MACI?A
% TRABALHO DE CONCLUS?O DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONT?M AS OP??ES DE OTIMIZA??O
% -----------------------------------------
clc, clear, close all

% ---
% DADOS DE ENTRADA
% ---
% chamando a fun??o dados_exemplo_21
[rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_21;

% ---
% VARI?VEIS DE PROJETO
% ---
% x1 = altura da laje (h) em metros
% x2 = asx1 para em 'cm^2'
% x3 = asxx para em 'cm^2'
% x4 = xposx altura da linha neutra em metros
% x5 = xneg altura da linha neutra em metros
% x2 ~ x4
% x3 ~ x5
altmin = 0.07;

% ---
% LIMITES DE VARI?VEIS DE PROJETO
% ---
% ver pdf limites [item 1]
Lb = [altmin; 0;0;0;0]; %limite inferior
Ub =[Inf; Inf; Inf;Inf; Inf]; %limite superior

% ---
% ESTIMATIVA INICIAL
% ---
x0 = [0.13 ;4 ;8 ;0.03 ;0.03]; %chute inicial
%                                           lx
% chute inicial da altura ?til => d = ------------- [7.22] pg. 338
%                                       psi2.ps3
% psi2 => quadro 7.6
% psi3 => quadro 7.7
%


% ---
% OP??ES PARA O OTIMIZADOR
% ---
options = optimoptions(@fmincon,'Algorithm','interior-point','Display','iter','PlotFcn','optimplotfval');


% ---
% RESTRI??ES LINEARES DE IGUALDADE
% ---
% ---
% RESTRI??ES LINEARES DE DESIGUALDADE
% ---
Aeq = [];
beq = [];
A = [];
b = []; 

% ---
% CHAMADA DA ROTINA DE OTIMIZA??O COM RESTRI??ES
% ---
[x,FunVal,ExitFlag,Output]=... 
    fmincon('exemplo_objf_21',x0,Aeq,beq,A,b,Lb,Ub,'exemplo_nolinear_constrains_21',options);

% C?LCULO DA ARMADURA M?NIMA FINAL
asminf = x(1)*romin*100;
% C?LCULO DA ARMADURA M?XIMA FINAL
asmaxf = x(1)*400;
% ALTURA ?TIL FINAL
dfinal = x(1) - dlinha;
% LIMITE DE xinferior
xinferior = 0.259*dfinal;
% LIMITE DE xsupeior
xsuperior = 0.45*dfinal;

% ---
% IMPRESS?O DOS RESULTADOS
% ---
disp('Solu??o:')
disp('-------------------------------- ')
disp(['h (m) = ' num2str(x(1))])
disp('-------------------------------- ')
disp(['d (m) = ' num2str(dfinal)])
disp('-------------------------------- ')
disp(['Asmin (cm?) = ' num2str((asminf))])
disp('-------------------------------- ')
disp(['Asmax (cm?) = ' num2str((asmaxf))])
disp('-------------------------------- ')
disp(['Asx (cm?/m) = ' num2str(x(2))])
disp('-------------------------------- ')
disp(['Asxx (cm?/m) = ' num2str(x(3))])
disp('-------------------------------- ')
disp(['xinf (m) = ' num2str(xinferior)])
disp('-------------------------------- ')
disp(['xsup (m) = ' num2str(xsuperior)])
disp('-------------------------------- ')
disp(['Linha neutra (x4) (m) = ' num2str(x(4))])
disp('-------------------------------- ')
disp(['Linha neutra (x5) (m) = ' num2str(x(5))])
disp('-------------------------------- ')
disp(['ExitFlag: ' num2str(ExitFlag)])
disp('-------------------------------- ')
disp(['Custo (R$) = ' num2str(FunVal)])
disp('-------------------------------- ')



    


