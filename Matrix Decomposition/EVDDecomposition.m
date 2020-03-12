%INICIO
function [V,L] = EVDDecomposition(X)

    [a,~] = size(X);
    % Coletando as dimens�es da matriz X para alocar em um escalar.
    
    A = X;
    % Criando uma c�pia dos dados recebidos.
    
    V = zeros(a);
    L = zeros(a);
    I = eye(a);
    % Inicializando as matrizes utilizadas ao longo do procedimento.
  
    for i = 1:50
      
        [Q,~] = QRHouse(A);
        % Coletando apenas a matriz ortogonal da fun��o QRDecomposition.
        
        Qt  = inv(Q);
        % Invertendo a matriz ortogonal obtida.
        A   = Qt*A*Q;
        % Aplicando a f�rmula de itera��o.
        
    end
    
    A = diag(A);
    % Coletando os autovalores de A uma vez que est�o presentes na diagonal
    % principal da matriz resultante do procedimento de itera��o.
    
    A = sort(A,'descend');
    % Organizando os autovalores em ordem crescente para evitar
    % diverg�ncias durante o c�lculo da matriz V.
  
    for i = 1:a
       
        L(i,i) = A(i);  
      
    end
    % La�o respons�vel por alocar os autovalores na forma de uma matriz diagonal.
    
    for i = 1:a
        
        Vetor = zeros(a,1);
        % Criando o vetor inicialmente nulo que ir� receber o autovetor
        % calculado pelo metodo descrito abaixo.
        
        Y = (X - A(i)*I);
        % Criando a matriz representando o sistema matricial que ser�
        % utilizado para o c�lculo do autovetor.
   
        Vetor = Gauss(Y,Vetor);
        % Etapa de elimina��o gaussiana que devolve a solu��o do sistema
        % representado por Y.
      
        V(i,:) = Vetor(:,1);
        % Alocamento dessa solu��o, um autovetor de X, na matriz ortogonal
        % formada pelos autovetores.
        
        V(i,:) = V(i,:)./norm(V(i,:));
        % Normaliza��o das colunas da matriz de autovetores para
        % simplifica��o na representa��o.
    end
    V = V';
    % Transpondo a matriz de autovetores para evitar diverg�ncias.
end
%FIM