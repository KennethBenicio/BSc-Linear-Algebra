%INICIO
function [U,S,V] = SVDDecomposition(A)
 
    [a,b] = size(A);
    U = zeros(a,b);
    % Matriz de solu��o.
    S = zeros(a,b);
    % Autovalores.
    V = zeros(a,a);
    % Autovetores.
    
    A1 = A'*A;
    % Transforma��o linear associada a matriz V.
    A2 = A*A';
    % Transforma��o linear associada a matriz U.
    
    [~,S] = EVDDecomposition(A1);
    % Coleta da matriz de autovalores.
    
    S = sqrt(S);
    % A matriz Sigma � a raiz quadrada da matriz de autovalores.
    
    [V,~] = EVDDecomposition(A1);
    [U,~] = EVDDecomposition(A2);
    % Matrizes de autovetores associados as transforma��es A1 e A2.

end
%FIM