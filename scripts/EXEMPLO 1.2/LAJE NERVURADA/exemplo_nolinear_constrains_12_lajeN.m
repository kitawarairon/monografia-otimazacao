 %nome do arquivo: exemplo_const_12_lajeN.m
%restrições do exemplo_12
%Aluno: Pedro Kitawara
%trabalho de conclusão de curso
%Este arquivo contém as restrições não-lineares
% g - restrições não lineares de desigualdade
% h  restrições não lineares de igualdade

function [g,h] = exemplo_nolinear_constrains_12_lajeN(x)
% ---
% RENOMEANDO AS VARIÁVEIS DE PROJETO
% ---
x1=x(1);x2=x(2);

[C1,C2,rhostell,fck,gamac,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,... 
    eforro,cargapiso,lx,ly,c,di,bw,bf,hw,q,gamaG,gamaQ] = dados_exemplo_12_N;

fcd = (fck*1000)/gamac; %MPa
%NOTA PARA SAÍDA EM METROS PRECISA MULTIPLICAR O FCK POR 1000

% ---
% AÇO
% ---
fyd = fyk/gamas; %MPa

% ---
% SEÇÃO
% ---
dlinha = c + 0.5*di; %m altura útil
htotal = x1 + hw;
d = htotal - dlinha;


% --- 
% CARREGAMENTO ÚLTIMO
% ---
area = (x1*bf) + hw*bw; % área da seção transversal [kNm]
g1 = gamaconc*area; % carregamento do peso próprio do concreto [kNm]
g2 = gamacp*ecp*bf; % carregamento do peso próprio do contra piso [kNm]
g3 = gamaforro*eforro*bf; % carregamento do peso próprio do forro [kNm]
g4 = cargapiso*bf; % carregamento do piso [kNm]
qlinha = q*bf; % carregamento acidental [kNm]
gt = (g1 + g2 + g3 + g4); % somatório carregamento permanente [kNm]
p = gamaG*gt + gamaQ*qlinha; % carregamento de cálculo último [kNm]

% ---
% ÁREA DE ARMADURA DA TRELIÇA FIOS INFERIORES
% ---
desc = 5/10; %diâmetro da armadura em cm
ast =(pi*(desc^2))/2;

% ---
% MOMENTO SOLICITANTE
% ---
msoc = (p*(lx^2))/8; % momento solicitante de cálculo 

% ---
% EQUACIONAMENTO DO CONCRETO
% ---
% Devido as particularidades do dimensionamento da viga 't' tem-se
% duas situações de caso:

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
%mbtotal = mb1 + mb2; % momento de cálculo resistente
%asb1 = (bf-bw)*hf*0.85*fcd/fyd; % parcela da armadura resistente para as mesas
%asb2 = 0.68*bw*fcd/fyd; % parcela da armadura resistente da alma;
%asb = asb1 + asb2; % armadura de cálculo para o caso B

mb1 = (bf-bw)*x1*0.85*fcd*(d-(0.5*x1)); % parcela do momento das mesas
mb2 = 0.68*bw*x2*fcd*(d- (0.4*x2)); % parcela do momento da alma
mbtotal = mb1 + mb2; % momento de cálculo resistente
% --------------------------------------------------------------------------------
asb1 = (bf-bw)*x1*0.85*fcd/fyd; % parcela da armadura resistente para as mesas
asb2 = 0.68*bw*fcd/fyd; % parcela da armadura resistente da alma;
asb = asb1 + asb2; % armadura de cálculo para o caso B

% ---
% ÁREA DE AÇO
% ---
% VIGOTA TB-6545
% TABELA BELGO GRUPO ARCELOR
% dinf = 5/10;
% as = 2*(pi*dinf^2/4);

% ---
% PARÂMETRO DE LINHA NEUTA
% ---
% colocar a equação da linha neutra
% constante de cálculo
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
    %disp('ypos: Fora da seção da viga "t"');
end

if yneg > 0 && yneg <= htotal
    xesc = yneg;
else
    %disp('yneg: Fora da seção da viga "t"');
end

disp(['yesc (m) = ' num2str(xesc)])

% ---
% VERIFICAÇÃO DO CASO DE DIMENSIONAMENTO
% ---
if xesc <= x1
    %CASO A
    % RESTRIÇÕES DE DESIGUALDADE .::CASO A::. ("<=")
    disp('CASO A')
    g(1) = msoc - ma ;
    g(2) = x2/d - 0.45; % restrição superior da linha neutra
    g(3) = -x2/d + 0.259; % restrição inferior da linha neutra
    g(4) = -htotal + hw;
    g(5) = -x1 + 4;
    % RESTRIÇÕES DE IGUALDADE
    h(1) = asa - ast; % restrição da área de armadadura de tração inferior
else
    %CASO B
    %RESTRIÇÕES DE DESIGUALDADE .::CASO::. B ("<=")
    disp('CASO B')
    g(1) = msoc - mbtotal;
    g(2) = x2/d - 0.45; % restrição superior da linha neutra
    g(3) = -x2/d + 0.259; % restrição inferior da linha neutra
    g(4) = -htotal + hw; 
    g(5) = -x1 + 4;
    % RESTRIÇÕES DE IGUALDADE
    h(1) = asb - ast; %restrição da área de armadadura de tração inferior
    
    
    %
end

%
end