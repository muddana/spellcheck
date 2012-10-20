function correction = specheck(word)
   dictionary = load('nwords').nwords;
    nwords = fieldnames(dictionary);
    edit1Words = edits1(word);

    candidates = intersect(nwords, edit1Words);
    correction = word;
    nwordCound = 0;
    for candidate = candidates
        if dictionary.(candidate) > nwordCound;
            correction = candidate;
            nwordCount = dictionary.(candidate);
        end
    end
end

function words = edits2(word)
    for newWord = edits1(word)
      words = [ words edits1(newWord)];
    end
end

function words = edits1(word)
  words = {};
    %deletes
    wordLen = length(word);
    for ii = 1:wordLen
          words(end+1) = [word(1:ii-1) word(ii+1:wordLen)];
    end
    %transposes
    for ii = 1:wordLen-1
        tmp = word;y = tmp(ii);tmp(ii) = tmp(ii+1);tmp(ii+1) = y; 
        words(end+1) = tmp;
    end
    %replaces
    alphabet = char(97:122);
    for ii=1:wordLen
    	 for jj = 1:length(alphabet)
    		    tmp = word; tmp(ii) = alphabet(jj);
    		    words(end+1) = tmp;
    	 end
    end
    %inserts
    for ii=1:wordLen
    	 for jj = 1:length(alphabet)
    		    tmp = [word(1:ii-1) alphabet(jj) word(ii:end)];
    		    words(end+1) = tmp;
    	 end
    end
end
