classdef breed < dog
    properties

        breedName = '';
        
    end
    
    methods
        % constructor
        function obj = breed(name, age, breedName)
            % this is super constructor
            obj = obj@dog(name, age);
            obj.breedName = breedName;
        end

        function breedName = getBreed(obj)
            breedName = obj.breedName;
        end

        function obj = setBreed(obj, newBreed)
            obj.breedName = newBreed;
        endfunction

        function speak(obj, sound)
            printf("%s says %s!\n", obj.name, sound);
        endfunction

    endmethods

endclassdef
