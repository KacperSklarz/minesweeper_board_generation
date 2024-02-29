function grid(n, m ,k ,s, t)
    if(~(round(n) == n), n < 0, ~(round(m) == m), m < 0, ~(round(k) == k), k < 0, ~(round(s) == s), s < 0, ~(round(t) == t), t < 0, s > m , t > n, k >= m*n )
        disp("Bledne Dane")
        disp("trzeci arument < m*n, czwarty <= drugiej, piąty <= pierwszej ")
    end

    x_1 = 0;
    x_2 = 0;
    sum_= 0;
    gridM = cell(m,n);
    handle = list();
    for i = 1:k
        x_1 = round(rand() * (n - 1)) + 1;
        x_2 = round(rand() * (m - 1)) + 1;
        
        while (s == x_1 & t == x_2 | ~isempty(gridM{x_1,x_2}))
            x_1 = round(rand() * (n - 1)) + 1;
            x_2 = round(rand() * (m - 1)) + 1;
        end
        gridM{x_1, x_2} = "X";
    end
    
    for i= 1:m
        for j = 1:n
            if(gridM{i,j} == "X")
                handle($+1) = [i,j];
           end
        end
    end
    
    for i= 1:m
        for j = 1:n
            if (gridM{i, j}~= "X")
               
                    for z = 1:k
                       if ([i+1,j] == handle(z) | [i,j+1] == handle(z) | [i+1,j+1] == handle(z) | [i-1,j] == handle(z) | [i,j-1] == handle(z) | [i-1,j-1] == handle(z)) | [i-1,j+1] == handle(z) | [i+1,j-1] == handle(z)
                        sum_ = sum_ + 1 ;
                        gridM{i, j} = sum_; 
                         
                       end 
                      
                    end
                  sum_ = 0;
                    
              
                        
            end
        end
    end
    temp = gridM{s,t};
    gridM{s,t} = "["+string(temp)+"]"
    disp(gridM);
    disp(handle);
endfunction
