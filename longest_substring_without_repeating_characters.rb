# @param {String} s
# @return {Integer}
def length_of_longest_substring(str)
  s = str.to_s
  if (s.length < 2)
    return s.length
  end
  maxStringSize, l, r = 0, 0, 0;
  seenChars = Hash.new()
  while ( r < s.length )
    newChar = s[r]
    charPos = seenChars[newChar]
    if !charPos.nil? && l <= charPos
      l = charPos + 1;
    else
      maxStringSize = [maxStringSize, r - l + 1].max;
    end
    seenChars[newChar] = r
    r+=1
  end
  return maxStringSize;
end

puts length_of_longest_substring "bhubuweehfc"
