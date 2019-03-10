function out = symn(symbol,n)
    %Return symbolic variables of format symbol+i where i = 1:n
    %symbol: desired symbol of n symbolic variables
    %n: number of desired symbols
    Sym = sym(symbol,[1,n]);
    String = arrayfun(@char, Sym,'uniform',0);
    %str2sym(
    for i = 1:n
        assignin('base', string(String(i)), str2sym(String(i)) );
    end
    out = Sym;
end    