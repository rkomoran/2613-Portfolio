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

histogramBeowulf = readFreq('Beowulf.txt');
% fieldnames retuns a cell array of strings with the names of the fields 
% disp(length(fieldnames(histogramBeowulf)))
% disp(histogramBeowulf)
histogramVindication = readFreq('Vindication.txt');
% disp(length(fieldnames(histogramVindication)))

function retval = determineOrigin(histogram1, histogram2, line)
    retVal = 0;
    histogram1Length = length(fieldnames(histogram1));
    histogram2Length = length(fieldnames(histogram2));
    pHistogram1 = 0;
    pHistogram2 = 0;

    % want to split line into indivual words
    words = strsplit(line);

    % need to check how many times that word (if it's in the histogram) appears
    % and divide it by the total words in that histogram
    for i = 1:length(words)
        % extract word
        word = words{i};
  
        % check if word exists as a field in freq struct
        if isfield(histogram1, word)
            % need to check the count of that word
            pHistogram1 = pHistogram1 + (histogram1.(word)/histogram1Length);
        endif

        if isfield(histogram2, word)
            % need to check the count of that word
            pHistogram2 = pHistogram2 + (histogram2.(word)/histogram2Length);
        endif
    endfor

    if (pHistogram1 > pHistogram2)
        disp("This is likely histogram1");
        retVal = pHistogram1
    else 
        disp("This is likely histogram2");
        retVal = pHistogram2
    endif
end

determineOrigin(histogramBeowulf, histogramVindication, "Forth he fared at the fated moment,");
