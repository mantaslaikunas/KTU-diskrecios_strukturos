function [ Poaibiai ] = generuotiPoaibius( V, virsuniuSkaicius )
    Poaibiai = {};
    if virsuniuSkaicius == 1
        for i=1:length(V)
            Poaibiai{length(Poaibiai)+1} = V(i);
        end
    else
    for i=1:length(V)
        tmpV = V;
        tmpV(i) = [];
        tmpPoaibiai = generuotiPoaibius(tmpV, virsuniuSkaicius-1);
        for j=1:length(tmpPoaibiai)
            poaibis = tmpPoaibiai{j};
            poaibis(length(poaibis)+1) = V(i);
            Poaibiai{length(Poaibiai) + 1} = poaibis; 
        end
    end
    end
end

