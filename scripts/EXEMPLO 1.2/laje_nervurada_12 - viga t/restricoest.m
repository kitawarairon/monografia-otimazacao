% ---
% VERIFICAÇÃO DO CASO DE DIMENSIONAMENTO
% ---   
if xesc <= hf
    % CASO A
    % disp('[CASO A]');
    % 
    % RESTRIÇÕES DE DESIGUALDADE "g"[CASO A]
    g(1) = msoc - ma; % restrição do momento solicitante <= momento resistente
    g(2) = x3/d - 0.45; % restrição superior da linha neutra
    g(3) = -x3/d + 0.259; % restrição inferior da linha neutra
    g(4) = x2 - (400*bw*x1); % restrição da armadura máxima
    g(5) = -x2 + romin*bw*x1*100; % restrição da armadura mínima
    % RESTRIÇÕES DE IGUALDADE    [CASO A]
    h(1) = x2 - ((0.85*fcd*bw*0.8*x3)/fyd);
elseif xesc > hf
    %CASO B
    % disp('[CASO B]');
    % RESTRIÇÕES DE DESIGUALDADE [CASO B]
    g(1) = msoc - mbtotal; % restrição do momento solicitante <= momento resistente
    g(2) = x3/d - 0.450; % restrição superior da linha neutra
    g(3) = -x3/d + 0.259; % restrição inferior da linha neutra
    g(4) = x2 - (400*bw*x1); % restrição da armadura máxima
    g(5) = -x2 + romin*bw*x1*100; % restrição da armadura mínima
    % RESTRIÇÕES DE IGUALDADE    [CASO B]
    h(1) = x2 - (((0.85*(bf-bw)*hf*fcd)+(0.68*x3*bw*fcd))/fyd); % arrumar esta formulação aqui
end
