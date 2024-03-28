disp("Running...");
total = 0;
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

function total = calculateTotalFrequency(histogram)
    total = 0;
    words = fieldnames(histogram);

    % numel gets number of elemets in an array
    for i = 1:numel(words)
        total = total + histogram.(words{i});
    end
end

function retval = naiveBayes(histogram, words)
  retval = 0;

  % get the total frequency of each word
  total = 0;

  % iterate over each field (word) in the histogram
  totalWords = fieldnames(histogram);

  % fieldnames returns a cell array of strings with the names of the fields
  % unique count
  histogramLength = length(fieldnames(histogram));

  total = calculateTotalFrequency(histogram);
  printf("Total size: %d\n", total);

  for i = 1:length(words)
    word = words{i};

    % need to check how many times that word (if it's in the histogram) appears
    % and divide it by the total words in that histogram
    if isfield(histogram, word)
      % this is taking that word in our string cell array and
      % dividing by the total length of all words in that cell array
      retval = retval + (histogram.(word) / total);
    endif
  endfor
end

function retval = determineOrigin(histogram1, histogram2, line)
    retval = 0;
    pHistogram1 = 0;
    pHistogram2 = 0;

    % want to split line into indivual words
    words = strsplit(line);

    pHistogram1 = naiveBayes(histogram1, words);
    pHistogram2 = naiveBayes(histogram2, words);

    printf("pHistogram1 = %d\n", pHistogram1);
    printf("pHistogram2 = %d\n", pHistogram2);

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

determineOrigin(histogramVindication, histogramBeowulf, "seas, a suckling child. High o'er his head they hoist the standard, a gold-wove banner; let billows take him, gave him to ocean. Grave were their spirits, mournful their mood. No man is able to say in sooth, no son of the halls, no hero 'neath heaven, -- who harbored that freight!");
