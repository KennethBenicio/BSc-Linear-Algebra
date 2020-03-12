%INICIO
function [Vetor] = Gauss(X,Valor)
    
    [a,~] = size(X);
    % Variável responsável por receber a dimensão da matriz inserida.
    
    k = 0;
    % Variável de apoio criada devido a necessidade de execução de um for com intervalo
    % de atuação dinâmico.
    
    G = horzcat(X,Valor);
    Vetor = zeros((a-1),1);
    
    % Nessa etapa ocorre o escalonamento da matriz extendida.
 
    for i = 1:(a - 1)
    % Estrutura responsável por mover a execução do script pelas linhas de X.
    % Uma vez que a primeira coluna é a unica que irá permanecer inalterada,
    % o termo (a-1) faz-se necessário para evitar a extrapolação da dimensão de U.
  
         k = k + 1;
         % Atualização da variável de apoio mencionada anteriormente.
     
         for j = 1:(a - k)
         % Estrutura responsável por executar as operações algébricas sobre as linhas de X.  
        
             c = G(k + j,i)/G(i,i);
             % Cálculo do coeficiente responsável por zerar os elementos abaixo do pivô.
        
             G(j+k,:) = G(j+k,:) - c*G(i,:);   
             % Atualização da matriz U.
         
         end 
    end

    % Nessa etapa é realizada a substituição retrógrada da matriz extendida
    % escalonada que representa o sistema matricial original.
    
    
    for i = a:-1:1
        
        if G(i,i+1) == 0
        % Condição para quando é necessário obter a solução para um vetor
        % de valores nulos.
        
            Vetor(i,1) = 1;
            % É uma forma de atribuir um valor de constante c a uma
            % variável do sistema e partir disso reescrever as outras
            % variáveis a partir dela.
            
            for j = (i-1):-1:1
                
               Vetor(j,1) = -Vetor(j+1,1)/G(j,j);
                
            end
 
        else
        % Essa etapa ocorre sempre que um vetor de valores não nulos for
        % fornecido ao algoritmo.
        
            Vetor(i,1) = (G(i,a+1) - G(i,i+1:a)*Vetor(i+1:a,1))/G(i,i);
            % Linha responsável por realizar a substituição retrógrada.
        end
      
    end
    %Essa metodologia funciona apenas para matrizes de rank total.
end
%FIM