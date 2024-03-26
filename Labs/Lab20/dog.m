classdef dog
    % dog contains properties of a dog

    properties
        % instance variables
        name = '';
        age = 0;
        
    endproperties

    methods
        % this is a constructor
        function obj = dog(name, age)
            obj.name = name;
            obj.age = age;
        endfunction
        % get name
        function dogName = getName(obj)
            dogName = obj.name;
        endfunction
        % set name
        function obj = setName(obj, newName)
            obj.name = newName;
        endfunction
        % get age
        function dogAge = getAge(obj)
            dogAge = obj.age;
        endfunction
        % set age
        function obj = setAge(obj, newAge)
            obj.age = newAge;
        endfunction

        function isGoodBoy(obj)
            % generate a random integer between 1 and 100
            num = randi(100);
            printf("%s is %d%% of a Good Boy\n", obj.name, num); 
        endfunction

        function disp(obj)
            printf("Hi! My name is %s and I am %d years old!", obj.name, obj.age);
        endfunction
        
    endmethods  

endclassdef