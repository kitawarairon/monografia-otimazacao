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

[C1,rhostell,fck,gamac,C2,fyk,gamas,gamaconc,gamacp,gamaforro,ecp,eforro,cargapiso,lx,ly,c,di,bw,bf,hf,q,gamaG,gamaQ] = dados_exemplo_12_N;
% ---
% DADOS DOS MATERIAIS
% ---
% CONCRETO
fcd = (fck*1000)/gamac; %MPa
% NOTA PARA SAÍDA EM METROS PRECISA MULTIPLICAR O FCK POR 1000

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
area = (hf*bf) + (x1-hf)*bw; % m^2
g1 = gamaconc*area; % carga peso próprio do concreto kN/m
g2 = gamacp*ecp*bf; % carga peso próprio do contra-piso kN/m
g3 = gamaforro*eforro*bf; % carga do peso próprio forro kN/m
g4 = cargapiso*bf; % carga do piso kN/m
qlinha = q*bf; % carregamento acidental kN/m
gt = g1 + g2 + g3 + g4; % somatório dos carregamentos permanentes kN/m
p = gamaG*gt + gamaQ*qlinha; % combinação última kN/m

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
ma = (((0.68*x2*d) - (0.272*(x2^2))))*bw*fcd; % momento resistente para caso A


% ---
% CASO B
% ---
mb1 = (bf-bw)*hf*0.85*fcd*(d-(0.5*hf));
mb2 = 0.68*bw*x2*fcd*(d-(0.4*x2));
mbtotal =  mb2 - mb1;

% ---
% ÁREA DE AÇO
% ---
% VIGOTA TB-6545
% TABELA BELGO GRUPO ARCELOR
dinf = di*100; 
as = 2*(pi*dinf^2/4);


% ---
% PARÂMETRO DE LINHA NEUTA
% ---
cte1 = 0.68*d;
cte2 = (cte1)^2;
cte3 = 1.088*((msoc)/(bf*fcd));
cte4 = cte2 - cte3;
cte5 = sqrt(cte4);

%xpos
xpos = (cte1 + cte5)/0.554; % xpos - cálculo da linha neutra [m]

%xneg
xneg = (cte1 - cte5)/0.554; % xneg - cálculo da linha neutra [m]

%ypos
ypos = 0.8*xpos;

%yneg
yneg = 0.8*xneg;
%

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
% VERIFICAÇÃO DO CASO DE DIMENSIONAMENTO
% ---
    
if xesc <= hf
    % CASO A
    %disp('[CASO A]');
    % 
    % RESTRIÇÕES DE DESIGUALDADE "g"[CASO A]
    g(1) = msoc - ma % restrição do momento solicitante <= momento resistente
    g(2) = x2/d - 0.45; % restrição superior da linha neutra
    %g(3) = -x2/d + 0.259; % restrição inferior da linha neutra
    % RESTRIÇÕES DE IGUALDADE    [CASO A]
    h(1) = as - ((0.85*fcd*bw*0.8*x2)/fyd);
    %h = [];
else
    %CASO B
    %disp('[CASO B]');
    % RESTRIÇÕES DE DESIGUALDADE [CASO B]
    g(1) = msoc - mbtotal
    g(2) = x2/d - 0.450;
    %g(3) = -x2/d + 0.259;
    % RESTRIÇÕES DE IGUALDADE    [CASO B]
    h(1) = as - (((0.85*(bf-bw)*hf*fcd)+(0.68*x2*bw*fcd))/fyd);
    %h = [];
end



%
end