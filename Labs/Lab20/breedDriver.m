% instantiating object
Fido = breed('Fido', 5, "Lab");

% get breed
disp(Fido.getBreed());

% set breed
Fido = Fido.setBreed('Hound');

% get breed
disp(Fido.getBreed());

% get dog's name
disp(Fido.getName());  % Output: Fido

% set dog's age
Fido = Fido.setAge(6);

% get dog's age
disp(Fido.getAge());   % Output: 6

% see how good of a boy the dog is
Fido.isGoodBoy();

% speak
Fido.speak("Woof");

