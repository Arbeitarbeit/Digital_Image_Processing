function dispersion = fv(x,~)
    dispersion = 1.0/(5*5) * sum((x - sum(x,'all')*(1.0/25)^2),'all');
end