disp('')

function magnitude = calculateMagnitude(matrix)
    magnitude = 0;
    for i = 1:length(matrix)
        magnitude += matrix(i)**2;
    endfor
    magnitude = sqrt(magnitude);
end

function retval = unitVector(matrix)
    retval = zeros(1, length(matrix));
    magnitude = calculateMagnitude(matrix);
    
    if (retval == matrix)
        return
    endif

    for i = 1:length(matrix)
        retval(i) = matrix(i) / magnitude;
    endfor
end

disp(unitVector([8, 10, 12, 14]));
