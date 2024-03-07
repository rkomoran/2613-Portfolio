disp("Running...");
function freq = readFreq(filename)
  freq = struct();

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

function retval = naiveBayes(histogram, words)
  retval = 0;
  % fieldnames returns a cell array of strings with the names of the fields
  histogramLength = length(fieldnames(histogram));

  for i = 1:length(words)
    word = words{i};

    % need to check how many times that word (if it's in the histogram) appears
    % and divide it by the total words in that histogram
    if isfield(histogram, word)
      retval = retval + (histogram.(word)/histogramLength);
    endif

  endfor
end

function retval = determineOrigin(histogram1, histogram2, line)
    retVal = 0;
    pHistogram1 = 0;
    pHistogram2 = 0;

    % want to split line into indivual words
    words = strsplit(line);

    pHistogram1 = naiveBayes(histogram1, words);
    pHistogram2 = naiveBayes(histogram2, words);

    if (pHistogram1 > pHistogram2)
        disp("More likely to be written by Mary Wollstonecraft");
        retVal = pHistogram1
    elseif (pHistogram2 > pHistogram1)
        disp("More likely to be written by Unknown Author");
        retVal = pHistogram2
    else
        disp("Could be either author");
    endif
end

histogramBeowulf = readFreq('Beowulf.txt');
histogramVindication = readFreq('Vindication.txt');

determineOrigin(histogramVindication, histogramBeowulf, "Forth he fared at the fated moment,");
