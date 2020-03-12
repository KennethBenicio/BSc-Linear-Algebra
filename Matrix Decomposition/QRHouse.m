%INICIO
function [Q,R] = QRHouse(A)

    [a,~] = size(A);
    Q = zeros(a);
    R = A;
    I = eye(a);
    
    
    for i = 1:a
            
        VElementar = zeros(a,1);
        
        Coluna = zeros(a,1);
        
        for j = i:a
            
            Coluna(j,1) = R(j,i);
            
        end
        
        if A(i,i) > 0
            
            VElementar(i,1) = norm(R(i:end,i));
            VColuna = Coluna + VElementar;
        
        else
            
            VElementar(i,1) = -norm(R(i:end,i));
            VColuna = Coluna + VElementar;
       
        end
        
        V1 = (VColuna')*  (VColuna);
        V2 = (VColuna) * (VColuna');
        
        if V1 == 0
            
            V1 = 1;
            
        end
        
        H = I - (2/V1).*V2;
       
        if i == 1
            
            Q = H;
            R = H*R;
      
        else
            
            Q = Q*H;
            R = H*R;
            
        end
        
    end
    
end
%FIM