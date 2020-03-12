%INICIO
function [V,L] = EVDDecomposition(X)

    [a,~] = size(X);
    % Coletando as dimensões da matriz X para alocar em um escalar.
    
    A = X;
    % Criando uma cópia dos dados recebidos.
    
    V = zeros(a);
    L = zeros(a);
    I = eye(a);
    % Inicializando as matrizes utilizadas ao longo do procedimento.
  
    for i = 1:50
      
        [Q,~] = QRHouse(A);
        % Coletando apenas a matriz ortogonal da função QRDecomposition.
        
        Qt  = inv(Q);
        % Invertendo a matriz ortogonal obtida.
        A   = Qt*A*Q;
        % Aplicando a fórmula de iteração.
        
    end
    
    A = diag(A);
    % Coletando os autovalores de A uma vez que estão presentes na diagonal
    % principal da matriz resultante do procedimento de iteração.
    
    A = sort(A,'descend');
    % Organizando os autovalores em ordem crescente para evitar
    % divergências durante o cálculo da matriz V.
  
    for i = 1:a
       
        L(i,i) = A(i);  
      
    end
    % Laço responsável por alocar os autovalores na forma de uma matriz diagonal.
    
    for i = 1:a
        
        Vetor = zeros(a,1);
        % Criando o vetor inicialmente nulo que irá receber o autovetor
        % calculado pelo metodo descrito abaixo.
        
        Y = (X - A(i)*I);
        % Criando a matriz representando o sistema matricial que será
        % utilizado para o cálculo do autovetor.
   
        Vetor = Gauss(Y,Vetor);
        % Etapa de eliminação gaussiana que devolve a solução do sistema
        % representado por Y.
      
        V(i,:) = Vetor(:,1);
        % Alocamento dessa solução, um autovetor de X, na matriz ortogonal
        % formada pelos autovetores.
        
        V(i,:) = V(i,:)./norm(V(i,:));
        % Normalização das colunas da matriz de autovetores para
        % simplificação na representação.
    end
    V = V';
    % Transpondo a matriz de autovetores para evitar divergências.
end
%FIM