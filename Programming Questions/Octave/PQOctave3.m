disp("Running...");
function freq = readFreq(filename)
  freq = struct(); % Initialize empty struct

  inputFile = fopen(filename, "r");

  while (!feof(inputFile))
    % line is a matrix array
    line = fgetl(inputFile);
    % strsplit returns a cell array
    words = strsplit(line);

    for i = 1:length(words)
      % extract word
      word = words{i};

      % check if word exists as a field in freq struct
      if isfield(freq, word)
        % increment count for that word
        freq.(word) = freq.(word) + 1;
      else
        % if not found in freq struct, initialize count to 1
        freq.(word) = 1;
      endif
    endfor
  end
  fclose(inputFile);
end

histogramBeowulf = readFreq('Beowulf.txt');
histogramVindication = readFreq('Vindication.txt');

function determineOrigin = result(histogram1, histogram2, line)

end


