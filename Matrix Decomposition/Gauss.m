%INICIO
function [Vetor] = Gauss(X,Valor)
    
    [a,~] = size(X);
    % Vari�vel respons�vel por receber a dimens�o da matriz inserida.
    
    k = 0;
    % Vari�vel de apoio criada devido a necessidade de execu��o de um for com intervalo
    % de atua��o din�mico.
    
    G = horzcat(X,Valor);
    Vetor = zeros((a-1),1);
    
    % Nessa etapa ocorre o escalonamento da matriz extendida.
 
    for i = 1:(a - 1)
    % Estrutura respons�vel por mover a execu��o do script pelas linhas de X.
    % Uma vez que a primeira coluna � a unica que ir� permanecer inalterada,
    % o termo (a-1) faz-se necess�rio para evitar a extrapola��o da dimens�o de U.
  
         k = k + 1;
         % Atualiza��o da vari�vel de apoio mencionada anteriormente.
     
         for j = 1:(a - k)
         % Estrutura respons�vel por executar as opera��es alg�bricas sobre as linhas de X.  
        
             c = G(k + j,i)/G(i,i);
             % C�lculo do coeficiente respons�vel por zerar os elementos abaixo do piv�.
        
             G(j+k,:) = G(j+k,:) - c*G(i,:);   
             % Atualiza��o da matriz U.
         
         end 
    end

    % Nessa etapa � realizada a substitui��o retr�grada da matriz extendida
    % escalonada que representa o sistema matricial original.
    
    
    for i = a:-1:1
        
        if G(i,i+1) == 0
        % Condi��o para quando � necess�rio obter a solu��o para um vetor
        % de valores nulos.
        
            Vetor(i,1) = 1;
            % � uma forma de atribuir um valor de constante c a uma
            % vari�vel do sistema e partir disso reescrever as outras
            % vari�veis a partir dela.
            
            for j = (i-1):-1:1
                
               Vetor(j,1) = -Vetor(j+1,1)/G(j,j);
                
            end
 
        else
        % Essa etapa ocorre sempre que um vetor de valores n�o nulos for
        % fornecido ao algoritmo.
        
            Vetor(i,1) = (G(i,a+1) - G(i,i+1:a)*Vetor(i+1:a,1))/G(i,i);
            % Linha respons�vel por realizar a substitui��o retr�grada.
        end
      
    end
    %Essa metodologia funciona apenas para matrizes de rank total.
end
%FIM