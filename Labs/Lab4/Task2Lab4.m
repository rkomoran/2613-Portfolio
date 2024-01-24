prompt = "How many values would you like to input?\t";
promp2 = ""

x = input(prompt);
disp(x)
values = 0;

for i = 1:x
    values(i) = input(promp2);
end

function toReturn = unitVector(inputVector)
    total = 0;
    for i = 1:length(inputVector)
        total += (inputVector(i))^2;
    end

    magnitude = sqrt(total);

    for j = 1:length(inputVector)
        inputVector(j) = inputVector(j) / magnitude;
    end

    toReturn = inputVector;
end

disp(unitVector(values));

