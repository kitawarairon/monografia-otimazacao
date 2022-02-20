% -----------------------------------------
% NOME DO ARQUIVO: exemplo_otm_23.m
% OTIMIZAÇÃO PARA LAJE MACIÇA
% TRABALHO DE CONCLUSÃO DO CURSO
% AUTOR: PEDRO KITAWARA
% ESTE ARQUIVO CONTÉM AS OPÇÕES DE OTIMIZAÇÃO
% -----------------------------------------
clc, clear, close all

% ---
% DADOS DE ENTRADA
% ---
% chamando a função dados_exemplo_23
[rhostell,fck,gamac,fcd,fyk,... 
    gamas,fyd,gamaconc,gamacp,gamaforro,ecp,eforro,... 
    cargapiso,lx,ly,c,di,bw,q,gamaG,gamaQ,romin,C2,C1,dlinha] = dados_exemplo_23;

% ---
% VARIÁVEIS DE PROJETO
% ---
% x1 = altura da laje (h) em metros
% x2 = asx1 para em 'cm^2'
% x3 = asy1 para em 'cm^2'
% x4 = asxx para em 'cm^2'
% x5 = xposx altura da linha neutra em metros
% x6 = xposy altura da linha neutra em metros
% x7 = xneg altura da linha neutra em metros
altmin = 0.07;

% ---
% LIMITES DE VARIÁVEIS DE PROJETO
% ---
% ver pdf limites [item 1]
Lb = [altmin; 0;0;0;0;0;0]; %limite inferior
Ub =[Inf; Inf; Inf;Inf; Inf;Inf;Inf]; %limite superior

% ---
% ESTIMATIVA INICIAL
% ---
x0 = [0.13 ;4 ;4 ;8 ;0.03 ;0.03 ;0.03]; %chute inicial
%                                           lx
% chute inicial da altura útil => d = ------------- [7.22] pg. 338
%                                       psi2.ps3
% psi2 => quadro 7.6
% psi3 => quadro 7.7
%


% ---
% OPÇÕES PARA O OTIMIZADOR
% ---
options = optimoptions(@fmincon,'Algorithm','interior-point','Display','iter','PlotFcn','optimplotfval');


% ---
% RESTRIÇÕES LINEARES DE IGUALDADE
% ---
% ---
% RESTRIÇÕES LINEARES DE DESIGUALDADE
% ---
Aeq = [];
beq = [];
A = [];
b = []; 

% ---
% CHAMADA DA ROTINA DE OTIMIZAÇÃO COM RESTRIÇÕES
% ---
[x,FunVal,ExitFlag,Output]=... 
    fmincon('exemplo_objf_23',x0,Aeq,beq,A,b,Lb,Ub,'exemplo_nolinear_constrains_23',options);

% CÁLCULO DA ARMADURA MÍNIMA FINAL
asminf = x(1)*romin*100;
% CÁLCULO DA ARMADURA MÁXIMA FINAL
asmaxf = x(1)*400;
% ALTURA ÚTIL FINAL
dfinal = x(1) - dlinha;
% LIMITE DE xinferior
xinferior = 0.259*dfinal;
% LIMITE DE xsupeior
xsuperior = 0.45*dfinal;

% ---
% IMPRESSÃO DOS RESULTADOS
% ---
disp('Solução:')
disp('-------------------------------- ')
disp(['h (m) = ' num2str(x(1))])
disp('-------------------------------- ')
disp(['d (m) = ' num2str(dfinal)])
disp('-------------------------------- ')
disp(['Asmin (cm²) = ' num2str((asminf))])
disp('-------------------------------- ')
disp(['Asmax (cm²) = ' num2str((asmaxf))])
disp('-------------------------------- ')
disp(['Asx (cm²/m) = ' num2str(x(2))])
disp('-------------------------------- ')
disp(['Asy (cm²/m) = ' num2str(x(3))])
disp('-------------------------------- ')
disp(['Asxx (cm²/m) = ' num2str(x(4))])
disp('-------------------------------- ')
disp(['xinf (m) = ' num2str(xinferior)])
disp('-------------------------------- ')
disp(['xsup (m) = ' num2str(xsuperior)])
disp('-------------------------------- ')
disp(['Linha neutra (x5) (m) = ' num2str(x(5))])
disp('-------------------------------- ')
disp(['Linha neutra (x6) (m) = ' num2str(x(6))])
disp('-------------------------------- ')
disp(['Linha neutra (x7) (m) = ' num2str(x(7))])
disp('-------------------------------- ')
disp(['ExitFlag: ' num2str(ExitFlag)])
disp('-------------------------------- ')
disp(['Custo (R$) = ' num2str(FunVal)])
disp('-------------------------------- ')



    


