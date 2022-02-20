 %nome do arquivo: exemplo_const_12_lajeN.m
%restri��es do exemplo_12
%Aluno: Pedro Kitawara
%trabalho de conclus�o de curso
%Este arquivo cont�m as restri��es n�o-lineares
% g - restri��es n�o lineares de desigualdade
% h  restri��es n�o lineares de igualdade

function [g,h] = exemplo_nolinear_constrains_12_lajeN(x)
% ---
% RENOMEANDO AS VARI�VEIS DE PROJETO
% ---
x1=x(1);x2=x(2);

[C1,C2,rhostell,fck,gamac,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,... 
    eforro,cargapiso,lx,ly,c,di,bw,bf,hw,q,gamaG,gamaQ] = dados_exemplo_12_N;

fcd = (fck*1000)/gamac; %MPa
%NOTA PARA SA�DA EM METROS PRECISA MULTIPLICAR O FCK POR 1000

% ---
% A�O
% ---
fyd = fyk/gamas; %MPa

% ---
% SE��O
% ---
dlinha = c + 0.5*di; %m altura �til
htotal = x1 + hw;
d = htotal - dlinha;


% --- 
% CARREGAMENTO �LTIMO
% ---
area = (x1*bf) + hw*bw; % �rea da se��o transversal [kNm]
g1 = gamaconc*area; % carregamento do peso pr�prio do concreto [kNm]
g2 = gamacp*ecp*bf; % carregamento do peso pr�prio do contra piso [kNm]
g3 = gamaforro*eforro*bf; % carregamento do peso pr�prio do forro [kNm]
g4 = cargapiso*bf; % carregamento do piso [kNm]
qlinha = q*bf; % carregamento acidental [kNm]
gt = (g1 + g2 + g3 + g4); % somat�rio carregamento permanente [kNm]
p = gamaG*gt + gamaQ*qlinha; % carregamento de c�lculo �ltimo [kNm]

% ---
% �REA DE ARMADURA DA TRELI�A FIOS INFERIORES
% ---
desc = 5/10; %di�metro da armadura em cm
ast =(pi*(desc^2))/2;

% ---
% MOMENTO SOLICITANTE
% ---
msoc = (p*(lx^2))/8; % momento solicitante de c�lculo 

% ---
% EQUACIONAMENTO DO CONCRETO
% ---
% Devido as particularidades do dimensionamento da viga 't' tem-se
% duas situa��es de caso:

% ---
% CASO A
% ---
% mres = (0.68*x*d-0.272x^2)*bw*fcd;
ma = ((0.68*x2*d) - (0.272*(x2^2)))*bw*fcd; % momento resistente
asa = (0.85*fcd*bw*0.8*x2)/fyd; % armadura resistente

% ---
% CASO B
% ---

%mb1 = (bf-bw)*hf*0.85*fcd*(d-(0.5*hf)); % parcela do momento das mesas
%mb2 = 0.68*bw*x2*fcd*(d-0.4*x2); % parcela do momento da alma
%mbtotal = mb1 + mb2; % momento de c�lculo resistente
%asb1 = (bf-bw)*hf*0.85*fcd/fyd; % parcela da armadura resistente para as mesas
%asb2 = 0.68*bw*fcd/fyd; % parcela da armadura resistente da alma;
%asb = asb1 + asb2; % armadura de c�lculo para o caso B

mb1 = (bf-bw)*x1*0.85*fcd*(d-(0.5*x1)); % parcela do momento das mesas
mb2 = 0.68*bw*x2*fcd*(d- (0.4*x2)); % parcela do momento da alma
mbtotal = mb1 + mb2; % momento de c�lculo resistente
% --------------------------------------------------------------------------------
asb1 = (bf-bw)*x1*0.85*fcd/fyd; % parcela da armadura resistente para as mesas
asb2 = 0.68*bw*fcd/fyd; % parcela da armadura resistente da alma;
asb = asb1 + asb2; % armadura de c�lculo para o caso B

% ---
% �REA DE A�O
% ---
% VIGOTA TB-6545
% TABELA BELGO GRUPO ARCELOR
% dinf = 5/10;
% as = 2*(pi*dinf^2/4);

% ---
% PAR�METRO DE LINHA NEUTA
% ---
% colocar a equa��o da linha neutra
% constante de c�lculo
cte1 = 0.68*d;
cte2 = (cte1)^2;
cte3 = 1.088*(msoc/(bf*fcd));
cte4 = cte2 - cte3;
cte5 = sqrt(cte4);

%xpos
xpos = (cte1 + cte5)/0.554;

%xneg
xneg = (cte1 - cte5)/0.554;

%ypos
ypos = 0.8*xpos;

%yneg
yneg = 0.8*xneg;
%

% ---
% ESCOLHENDO O VALOR DO "X"
% ---
if ypos > 0 && xpos <= htotal
    xesc = ypos;
else
    %disp('ypos: Fora da se��o da viga "t"');
end

if yneg > 0 && yneg <= htotal
    xesc = yneg;
else
    %disp('yneg: Fora da se��o da viga "t"');
end

disp(['yesc (m) = ' num2str(xesc)])

% ---
% VERIFICA��O DO CASO DE DIMENSIONAMENTO
% ---
if xesc <= x1
    %CASO A
    % RESTRI��ES DE DESIGUALDADE .::CASO A::. ("<=")
    disp('CASO A')
    g(1) = msoc - ma ;
    g(2) = x2/d - 0.45; % restri��o superior da linha neutra
    g(3) = -x2/d + 0.259; % restri��o inferior da linha neutra
    g(4) = -htotal + hw;
    g(5) = -x1 + 4;
    % RESTRI��ES DE IGUALDADE
    h(1) = asa - ast; % restri��o da �rea de armadadura de tra��o inferior
else
    %CASO B
    %RESTRI��ES DE DESIGUALDADE .::CASO::. B ("<=")
    disp('CASO B')
    g(1) = msoc - mbtotal;
    g(2) = x2/d - 0.45; % restri��o superior da linha neutra
    g(3) = -x2/d + 0.259; % restri��o inferior da linha neutra
    g(4) = -htotal + hw; 
    g(5) = -x1 + 4;
    % RESTRI��ES DE IGUALDADE
    h(1) = asb - ast; %restri��o da �rea de armadadura de tra��o inferior
    
    
    %
end

%
end