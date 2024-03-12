disp("");
f1 = @(x) (x.^2/3) - 5;
f2 = @(x) log(x + 1);
% returns 0 if false, 1 if true
compareTo = @(x, y) x <= y;

values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

function retval = compareListPositions(f1, f2, compareTo, values)
    retval = 0;
    for i = 2:length(values)
        if (compareTo(f1(values(i - 1)), f2(values(i))))
            retval += 1;
        endif
    endfor
end

disp(compareListPositions(f1, f2, compareTo, values));