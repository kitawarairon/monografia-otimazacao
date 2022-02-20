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
% x1 = h em 'm'
% x2 = as em 'cm^2'

% ---
% LIMITES DE VARIÁVEIS DE PROJETO
% ---
Lb = [11.5/100;0]; %limite inferior
Ub =[Inf; Inf]; %limite superior

[C1,rhostell,fck,gamac,C2,fyk,gamas,gamaconc... 
    ,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;
% ---
% DADOS DE ENTRADA PARA RESTRIÇÕES LINEARES
% ---


% ---
% DADOS DA GEOMETRIA DA LAJE E SEÇÃO
% ---
dlinha = c + 0.5*di; %m altura útil


% ---
% CONCRETO
% ---
fcd = (fck*1000)/gamac; %MPa

% ---
% AÇO
% ---
fyd = fyk/gamas; %MPa


% ---
% ESTIMATIVA INICIAL
% ---
x0 = [12/100; 0.04];

% ---
% CHAMADA DA ROTINA DE OTIMIZAÇÃO COM RESTRIÇÕES
% ---
[x,FunVal,ExitFlag,Output]=... 
    fmincon('exemplo_objf_12_lajeN',x0,[],[],[],[],Lb,Ub,'exemplo_nolinear_constrains_12_lajeN',options);

% ALTURA ÚTIL FINAL
df = x(1) - dlinha;

% limites da linha neutra
xinf = 0.259*df;
xsup = 0.45*df;

% hw -  altura da alma
hw = x(1) - hf;


% ---
% IMPRESSÃO DOS RESULTADOS
% ---
disp('-------------------------------- ')
disp('Solução:')
disp('-------------------------------- ')
disp(['h  (m) = ' num2str(x(1))])
disp('-------------------------------- ')
disp(['xinf  (m) = ' num2str(xinf)])
disp('-------------------------------- ')
disp(['x  (m) = ' num2str(x(2))])
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

if x(2) > 0 && x(2) < xinf
    disp('DOMÍNIO 2')
    disp('-------------------------------- ')
    if x(2) >= xinf && x(2)< xsup
        disp('DOMÍNIO 3')
        disp('-------------------------------- ')
    end
    
else
    disp('FORA DOS DOMÍNIOS')
    disp('-------------------------------- ')
    
end

