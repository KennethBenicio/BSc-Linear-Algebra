%IN�CIO
function [L,U] = LUDecomposition(x);
% Declara��o da fun��o : A inser��o de uma matriz X fornece uma sa�da L,U.
  
  a = size(x);
  % Vari�vel respons�vel por receber a dimens�o da matriz inserida.
  
  if a(1,1) != a(1,2)
    
    disp('Nao e possivel prosseguir!')
    return
    
  endif
  
  
  L = eye(a);
  % Cria��o de uma matriz identidade de mesma dimens�o da matriz inserida.
  U = x(:,:);
  % Cria��o de uma c�pia dos dados da matriz inserida.
  
  k = 0;
  % Vari�vel de apoio criada devido a necessidade de execu��o de um for com intervalo
  % de atua��o din�mico.
  
  for i = 1:(a - 1)
  % Estrutura respons�vel por mover a execu��o do script pelas linhas de X.
  % Uma vez que a primeira coluna � a unica que ir� permanecer inalterada,
  % o termo (a-1) faz-se necess�rio para evitar a extrapola��o da dimens�o de U.
  
      k = k + 1;
      % Atualiza��o da vari�vel de apoio mencionada anteriormente.
     
     for j = 1:(a - k)
     % Estrutura respons�vel por executar as opera��es alg�bricas sobre as linhas de X.  
        
        if U(i,i) == 0
          
          disp('Processo interrompido devido a presen�a de um divisor nulo!')
          return;
          
        endif
        
        c = U(k + j,i)/U(i,i);
        % C�lculo do coeficiente respons�vel por zerar os elementos abaixo do piv�.
        
        L(k+j,i) = c;
        % Atualiza��o da matriz L.
        
        U(j+k,:) = U(j+k,:) - c*U(i,:);   
        % Atualiza��o da matriz U.
        
      endfor 
  endfor

clc; 
endfunction
%FIM