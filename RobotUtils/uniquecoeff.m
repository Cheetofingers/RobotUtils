function out = uniquecoeff(A)
    syms s;
    UniqueVals = s;
    FoundCount = 0;
    for i=1:length(A) 
        for j=1:length(A)
            if(has(A(i), A(j)))
                FoundCount = FoundCount +1;
            end
        end
        if(FoundCount==1)
            if(UniqueVals(1)==s)
                UniqueVals(1) = A(i);
            else
                UniqueVals = horzcat(UniqueVals,A(i));
            end
        end
        FoundCount = 0;
    end
    out = UniqueVals;
end