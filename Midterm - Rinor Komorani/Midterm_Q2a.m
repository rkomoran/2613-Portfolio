disp("")

function retval = uniqueChar(string)
    retval = [];
    index = 1;
    for i = 1:length(string)
        for j = i:length(string)
            if (!(string(i) == string(j)))
                retval += string(i);
            endif
        endfor
    endfor
endfunction

disp(uniqueChar("This example is a test"));