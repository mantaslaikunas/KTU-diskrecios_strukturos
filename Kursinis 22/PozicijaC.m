function [ poz ] = PozicijaC(a, c, papild, r, t )
    kelias = 0;
    if (a > 1),
      for i=1:(a-1),
        for j=1:(c-i + 1),
            kelias = kelias + RadimasC(i, c - j); 
        end
      end
        poz = kelias + papild;
    end
    if (a == 1),
        poz = papild;
    end
end

