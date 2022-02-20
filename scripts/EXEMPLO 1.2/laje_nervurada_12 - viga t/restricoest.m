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
elseif xesc > hf
    %CASO B
    % disp('[CASO B]');
    % RESTRI��ES DE DESIGUALDADE [CASO B]
    g(1) = msoc - mbtotal; % restri��o do momento solicitante <= momento resistente
    g(2) = x3/d - 0.450; % restri��o superior da linha neutra
    g(3) = -x3/d + 0.259; % restri��o inferior da linha neutra
    g(4) = x2 - (400*bw*x1); % restri��o da armadura m�xima
    g(5) = -x2 + romin*bw*x1*100; % restri��o da armadura m�nima
    % RESTRI��ES DE IGUALDADE    [CASO B]
    h(1) = x2 - (((0.85*(bf-bw)*hf*fcd)+(0.68*x3*bw*fcd))/fyd); % arrumar esta formula��o aqui
end
