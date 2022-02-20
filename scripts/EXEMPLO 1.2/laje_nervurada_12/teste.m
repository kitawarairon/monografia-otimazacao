x1 = 0.12;
x2 = 0.03;

[C1,C2,rhostell,fck,gamac,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;
% ---
% DADOS DOS MATERIAIS
% ---
%CONCRETO
fcd = (fck*1000)/gamac; %MPa
%NOTA PARA SAÍDA EM METROS PRECISA MULTIPLICAR O FCK POR 1000

% ---
% AÇO
% ---
fyd = fyk/gamas; %MPa

% ---
% PESO ESPECÍFICO DOS MATERIAIS - NBR 6120
% ---

% ---
% SEÇÃO
% ---
dlinha = c + 0.5*di; %m altura útil
d = x1 - dlinha; %altura útil

% ---
% COEFICIENTES DOS CARREGAMENTOS
% ---
gamaG = 1.4;
gamaQ = 1.4;

% --- 
% CARREGAMENTO ÚLTIMO
% ---
area = (hf*bf) + (x1-hf)*bw; %m2
g1 = gamaconc*area; % carga peso próprio do concreto kN/m
g2 = gamacp*ecp*bf; % carga peso próprio do contra-piso kN/m
g3 = gamaforro*eforro*bf; % carga do peso próprio forro kN/m
g4 = cargapiso*bf; % carga do piso kN/m
qlinha = q*bf; % carregamento acidental kN/m
gt = g1 + g2 + g3 + g4; % somatório dos carregamentos permanentes kN/m
p = gamaG*gt + gamaQ*qlinha; % combinação última kN/m

% ---
% ÁREA DE ARMADURA
% ---
% desc = 5/10; %diâmetro da armadura em cm
% as =(pi*(des^2))/2;

% ---
% MOMENTO SOLICITANTE
% ---
msoc = (p*(lx^2))/8;


% ---
% EQUACIONAMENTO DO CONCRETO
% ---
% Devido as particularidades do dimensionamento da viga 't' teremos que ter
% duas situações de caso:

% ---
% CASO A
% ---
ma = ((0.68*x2*d - 0.272*(x2^2)))*bw*fcd; % momento resistente para caso A
%asa = (0.306*bf*(d))/fyd;

% ---
% CASO B
% ---
mb1 = (bf-bw)*hf*0.85*fcd*(d-(0.5*hf));
mb2 = 0.68*bw*x2*fcd*(d-(0.4*x2));
mbtotal = mb1 + mb2;
%asb1 = (bf-bw)*hf*0.85*fcd/fyd; 
%asb2 = 0.68*bw*fcd/fyd;

% ---
% ÁREA DE AÇO
% ---
%VIGOTA TB-6545
%TABELA BELGO GRUPO ARCELOR
dinf = di*100;
as = 2*(pi*dinf^2/4);


% ---
% PARÂMETRO DE LINHA NEUTA
% ---
%colocar a equação da linha neutra
%constante de cálculo
cte1 = 0.68*d;
cte2 = (cte1)^2;
cte3 = 4*0.272*((msoc)/(bf*fcd));
cte4 = cte2 - cte3;
cte5 = sqrt(cte4);


%xpos
xpos = (cte1 + cte5)/0.554;

%xneg
xneg = (cte1 - cte5)/0.554;

%ypos
ypos = 0.8*xpos

%yneg
yneg = 0.8*xneg
%

% ---
% ESCOLHENDO O VALOR DO "X"
% ---
if ypos > 0 && ypos <= x1
    xesc = ypos;
    disp('YPOS ESCOLHIDO')
    
end

if yneg > 0 && yneg <= x1
    xesc = yneg;
    disp('YNEG ESCOLHIDO')
    
end



% ---
% VERIFICAÇÃO DO CASO DE DIMENSIONAMENTO
% ---
if xesc <= hf
    %CASO A
    % RESTRIÇÕES DE DESIGUALDADE [CASO A]
    disp('[CASO A]')
    h(1) = msoc - ma;
    h(2) = x2/d - 0.450;
    h(3) = -x2/d + 0.259;
    % RESTRIÇÕES DE IGUALDADE    [CASO A]
    %g(1) = as - (ma/(fyd*(d-0.4*x2)));
    g(1) = as - ((0.85*fcd*bw*0.8*x2)/fyd);
    
else
    %CASO B
    % RESTRIÇÕES DE DESIGUALDADE [CASO B]
    disp('CASO B')
    h(1) = msoc - mbtotal;
    h(2) = x2/d - 0.450;
    h(3) = -x2/d + 0.259;
    % RESTRIÇÕES DE IGUALDADE    [CASO B]
    g(1) = as - ((bf-bw)*hf*0.85*fcd)/fyd; % arrumar esta formulação aqui
end
