function [ C] = RadimasC( a, b )
                 C = 1;
                 for j=(b - a +1):(b),
                    C = C * j;
                 end
                 for j=1:a,
                    C = C / j;
                 end 
                 if (a ==0 || a == b),
                     C = 1;
                 end
end

