vector = [2, 0, 3];


function toReturn = unitVector(inputVector)
    total = 0;
    zeroCounter = 0;

    for i = 1:length(inputVector)
        if (inputVector(i) == 0)
            zeroCounter += zeroCounter;
        end
        total += (inputVector(i))^2;
    end

    if (zeroCounter == length(inputVector))
        toReturn = inputVector;
        return;
    end
    magnitude = sqrt(total);

    for j = 1:length(inputVector)
        inputVector(j) = inputVector(j) / magnitude;
    end

    toReturn = inputVector;
end


disp(unitVector(vector));
