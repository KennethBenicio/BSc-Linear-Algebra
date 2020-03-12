%INÍCIO
function [L,U] = LUDecomposition(x);
% Declaração da função : A inserção de uma matriz X fornece uma saída L,U.
  
  a = size(x);
  % Variável responsável por receber a dimensão da matriz inserida.
  
  if a(1,1) != a(1,2)
    
    disp('Nao e possivel prosseguir!')
    return
    
  endif
  
  
  L = eye(a);
  % Criação de uma matriz identidade de mesma dimensão da matriz inserida.
  U = x(:,:);
  % Criação de uma cópia dos dados da matriz inserida.
  
  k = 0;
  % Variável de apoio criada devido a necessidade de execução de um for com intervalo
  % de atuação dinâmico.
  
  for i = 1:(a - 1)
  % Estrutura responsável por mover a execução do script pelas linhas de X.
  % Uma vez que a primeira coluna é a unica que irá permanecer inalterada,
  % o termo (a-1) faz-se necessário para evitar a extrapolação da dimensão de U.
  
      k = k + 1;
      % Atualização da variável de apoio mencionada anteriormente.
     
     for j = 1:(a - k)
     % Estrutura responsável por executar as operações algébricas sobre as linhas de X.  
        
        if U(i,i) == 0
          
          disp('Processo interrompido devido a presença de um divisor nulo!')
          return;
          
        endif
        
        c = U(k + j,i)/U(i,i);
        % Cálculo do coeficiente responsável por zerar os elementos abaixo do pivô.
        
        L(k+j,i) = c;
        % Atualização da matriz L.
        
        U(j+k,:) = U(j+k,:) - c*U(i,:);   
        % Atualização da matriz U.
        
      endfor 
  endfor

clc; 
endfunction
%FIM