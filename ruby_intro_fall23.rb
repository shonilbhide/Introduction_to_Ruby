# Part 1
def two_sum?(a, n)
  a.each_with_index do |number, index|
    for nindex in index+1..a.length-1
        if a[index]+a[nindex] == n
            return true
        end
    end 
  end   
  return false  
end

def max_sub_array(a)
  sum = a[0]
  maxsum = a[0]
  for index in 0..a.length-1
      sum = [a[index],sum+a[index]].max
      maxsum = [maxsum,sum].max
  end
  return maxsum
end

def group_anagrams(a)
  anagrams = Hash.new
  a.each do |element|
      sorted = element.downcase.chars.sort.join
      if anagrams.keys.include? sorted
          anagrams[sorted] << element
      else
          anagrams[sorted] = [element]
      end
  end
  return anagrams.values
end

# Part 2
def brackets_match?(s)
  brackets = {"(" => ")","{"=>"}","["=>"]"}
  enteredchar = []
  for character in s.each_char
      if brackets.keys.include?character
          enteredchar << brackets[character]
      elsif brackets.values.include?character
          if enteredchar[enteredchar.length-1] == character
              enteredchar.delete_at(enteredchar.length-1)
          else
              return false
          end
      else
          next
      end
  end
  if enteredchar.empty?
      return true
  else
      return false
  end
end

def remove_and_append_vowels(s)
  vowels = s.scan(/[aeiouAEIOU]/)
  cons = s.scan(/[^aeiouAEIOU]/)
  return cons.join("") + vowels.join("")
end

def highest_frequency_word(s)
  if s.length == 0
    return ""
  end
  words = s.split(/ /)
  wordcount = {words[0].downcase => 1}
  max = words[0].downcase
  begin
  for word in words[1..-1]
      word = word.downcase
      if wordcount.keys.include?word 
          wordcount[word] += 1
          max = wordcount[max] >= wordcount[word] ? max : word
      else
          wordcount[word] = 1
      end
  end
  rescue
      return max
  end
  return max
end

# Part 3
class Book
  attr_accessor :title, :price
  
  def initialize(title, price)
    raise ArgumentError, "title is nil or an empty string" if title.nil? or title.empty?
    raise ArgumentError, "price is nil or less than or equal to zero" if price.nil? or price <= 0
    @title = title
    @price = price
  end

  def formatted_price 
    dollars = price.to_i
    cents = ((price - dollars) * 100).to_i
    if dollar == 0
      return cents.to_s + " cents only"
    elsif cents == 0 
      return dollars.to_s + " dollars only"
    else 
      return dollars.to_s + " dollars and " + cents.to_s + " cents only"
    end
  end

end
