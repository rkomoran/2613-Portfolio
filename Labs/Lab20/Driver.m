% instantiating object
Fido = dog('Fido', 5);

% get dog's name
disp(Fido.getName());  % Output: Fido

% set dog's age
Fido = Fido.setAge(6);

% get dog's age
disp(Fido.getAge());   % Output: 6

% see how good of a boy the dog is
Fido.isGoodBoy();

% use disp function
Fido.disp()