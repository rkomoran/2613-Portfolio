
% reads in the contents as a character array
% file read returns the data read as string & stores into cell array
data = fileread('DataInput.txt');
formatted_data = strsplit(data);

function retval = storeNums(num, array)
  % this maps each element from cell array with
  % a double conversion and is stored back into matrix
  converted_numbers = cellfun(@str2double, array);

  % matrix of 5 zeroes
  retval = zeros (1, num);

  for i = 1:num
      retval(i) = converted_numbers(i); % Use the converted numbers from cellfun
  end
end

% compute sums
function retval = sum(array)
  % retval needs to be initalized first
  retval = 0;
  for i = 1:length(array)
    retval += array(i);
  endfor
end

% compute avg
function retval = avg(array, size)
  retval = sum(array) / size;
end

% compute max
function retval = max(array)
  retval = -Inf;
  for i = 1:length(array)
    if (array(i) > retval)
      retval = array(i);
    endif
  endfor
end

% compute min
function retval = min(array)
  retval = Inf;
  for i = 1:length(array)
    if (array(i) < retval)
      retval = array(i);
    endif
  endfor
end

% compute fxp
% output is off by 1 -- not really sure where
function retval = fxp(array)
  retval = (1:5);
  for z = 1:length(array)
    currListNums = [];
    % off by one here, but cannot go from 0 to 50
    for k = 1:50
      currListNums(k) = (realpow(z, k) / factorial(k));
    endfor
    % had to add it manually here
    retval(z) = sum(currListNums) + 1;
  endfor
end

i = 1;
while (i < length(formatted_data))
  % to access elements of cell array, must use curly braces
  operand = formatted_data{i};

  % converting "5" to 5 from cell array
  maxVal = str2num(formatted_data{i+1});

  % points to first element after maxVal
  start_index = i + 2;

  % points to last element before next operand
  end_index = i + 6;

  numbers = formatted_data(start_index:end_index);

  switch (operand)
  case "SUM"
    result = sum(storeNums(maxVal, numbers));
    % could make these prints into a function too
    printf("SUM: %d\n",result);
  case "AVG"
    result = avg(storeNums(maxVal, numbers), maxVal);
    printf("AVG: %d\n",result);
  case "MAX"
    result = max(storeNums(maxVal, numbers));
    printf("MAX: %d\n",result);
  case "MIN"
    result = min(storeNums(maxVal, numbers));
    printf("MIN: %d\n",result);
  case "FXP"
    result = fxp(storeNums(maxVal, numbers));
    % make this into a function
    printf("FXP: ");
    printf(" %d ", result);
    printf("\n");
    %disp(result);
  endswitch

  % this now points to the other operand in cell array
  i += maxVal + 2;
endwhile
