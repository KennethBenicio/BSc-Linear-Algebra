%INICIO
function [Q,R] = QRDecomposition(x)
  
    a = size(x);
    % Adquirindo a dimensao da matriz X.
    Q = zeros(a);
    R = zeros(a);
    %Gerando as matrizes Q e R por meio da criacao de matrizes nulas.
    
    for i = 1:a
     
        for j = 1:(i-1)
          
            gamma  = dot(x(:,i),Q(:,j))./dot(Q(:,j),Q(:,j));
            %Calculo do escalar associado a cada projecao.
            Q(:,i) = Q(:,i) - gamma.*Q(:,j);
            %Calculo da nova coluna ortogonal ainda sem a soma da coluna original associada.
            R(i,j) = gamma;
            %Semelhante a matriz L do processo LU, a matriz R recebera o coeficiente de cada projecao.
        end
        
        Q(:,i) = Q(:,i) + x(:,i);
        %Somando a coluna da matriz original a coluna recem criada.
        beta   = 1./norm(Q(:,i)); 
        % Simplesmente a variavel que recebe o valor normalizado da coluna da matriz ortogonal.
        Q(:,i) = beta.*Q(:,i);
        %Processo de normalizacao das colunas.
        R(i,i) = 1./beta;
    
    end
   
   R = R';
   %Transpondo a matriz R.
  
end
%FIM