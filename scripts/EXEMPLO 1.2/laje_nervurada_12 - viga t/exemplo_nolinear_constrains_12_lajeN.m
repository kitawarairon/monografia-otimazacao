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
% x1 - altura da viga [m]
% x2 - asx [cm^2] 
% x3 - linha neutra referente � asx [m]

x1=x(1);x2=x(2);x3=x(3);

[C1,rhostell,fck,romin,gamac,C2,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;
% ---
% DADOS DOS MATERIAIS
% ---
% CONCRETO
fcd = (fck*1000)/gamac; %MPa
% NOTA PARA SA�DA EM METROS PRECISA MULTIPLICAR O FCK POR 1000

% ---
% A�O
% ---
fyd = fyk/gamas; %MPa

% ---
% PESO ESPEC�FICO DOS MATERIAIS - NBR 6120
% ---

% ---
% SE��O
% ---
dlinha = c + 0.5*di; % dlinha [m] 
d = x1 - dlinha; % altura �til [m]

% ---
% COEFICIENTES DOS CARREGAMENTOS
% ---
gamaG = 1.4;
gamaQ = 1.4;

% --- 
% CARREGAMENTO �LTIMO
% ---
area = (hf*bf) + (x1-hf)*bw; % m^2
g1 = gamaconc*area; % carga peso pr�prio do concreto kN/m
g2 = gamacp*ecp*bf; % carga peso pr�prio do contra-piso kN/m
g3 = gamaforro*eforro*bf; % carga do peso pr�prio forro kN/m
g4 = cargapiso*bf; % carga do piso kN/m
qlinha = q*bf; % carregamento acidental kN/m
%gt = g1 + g2 + g3 + g4; % somat�rio dos carregamentos permanentes kN/m
%p = gamaG*gt + gamaQ*qlinha; % combina��o �ltima kN/m
% ---
% ADICIONANDO O PESO DO EPS
% ---
gamaeps = 0.137; % PESO ESPECIFICO DO EPS kN/m^3
g5 = gamaeps*(bf-bw)*(x1-hf);
gt = g1 + g2 + g3 + g4 + g5;
p = gamaG*gt + gamaQ*qlinha; % combina��o �ltima kN/m

% ---
% MOMENTO SOLICITANTE
% ---
msoc = (p*(lx^2))/8;
% ---
% EQUACIONAMENTO DO CONCRETO
% ---
% ---
% CASO A
% ---
ma = (((0.68*x3*d) - (0.272*(x3^2))))*bw*fcd; % momento resistente para caso A
% ---
% CASO B
% ---
mb1 = (bf-bw)*hf*0.85*fcd*(d - (0.5*hf));
mb2 = 0.68*bw*x3*fcd*(d -(0.4*x3));
mbtotal = mb2 - mb1;

% ---
% PAR�METRO DE LINHA NEUTA
% ---
cte1 = 0.68*d;
cte2 = (cte1)^2;
cte3 = 1.088*((msoc)/(bf*fcd));
cte4 = cte2 - cte3;
cte5 = sqrt(cte4);
xpos = (cte1 + cte5)/0.554; % xpos - c�lculo da linha neutra [m]
xneg = (cte1 - cte5)/0.554; % xneg - c�lculo da linha neutra [m]
ypos = 0.8*xpos;
yneg = 0.8*xneg;
% ---
% ESCOLHENDO O VALOR DO "X"
% ---
if ypos > 0 && ypos <= x1
    xesc = ypos;
    %disp('xecs = ypos');
    
end

if yneg > 0 && yneg <= x1
    xesc = yneg;
    %disp('xesc = yneg');

end

%xfinal = xesc;                           %%%%%%%%%%%%%%
%disp(['yesc (m) = ' num2str(xfinal)])    %%%%%%%%%%%%%%

% ---
% VERIFICA��O DO CASO DE DIMENSIONAMENTO
% ---   
if xesc <= hf
    % CASO A
    % disp('[CASO A]');
    % 
    % RESTRI��ES DE DESIGUALDADE "g"[CASO A]
    g(1) = msoc - ma; % restri��o do momento solicitante <= momento resistente
    g(2) = x3/d - 0.45; % restri��o superior da linha neutra
    g(3) = -x3/d + 0.259; % restri��o inferior da linha neutra
    g(4) = x2 - (400*bw*x1); % restri��o da armadura m�xima
    g(5) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima

    % RESTRI��ES DE IGUALDADE    [CASO A]
    h(1) = x2 - ((0.85*fcd*bw*0.8*x3)/fyd);
    %h = [];
elseif xesc > hf
    %CASO B
    % disp('[CASO B]');
    % RESTRI��ES DE DESIGUALDADE [CASO B]
    g(1) = msoc - mbtotal
    g(2) = x3/d - 0.450;
    g(3) = -x3/d + 0.259;
    g(4) = x2 - (400*bw*x1); % restri��o da armadura m�xima
    g(5) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima

    
    % RESTRI��ES DE IGUALDADE    [CASO B]
    h(1) = x2 - (((0.85*(bf-bw)*hf*fcd)+(0.68*x3*bw*fcd))/fyd); % arrumar esta formula��o aqui
end



%
end