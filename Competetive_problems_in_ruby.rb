
=begin
two_sum?(a, n) takes an array of integers a and an additional integer n as arguments and 
returns true if there are two different elements in a adding up to the integer n, and 
it returns false if not.
Example: 
two_sum?([], 3) returns false
two_sum?([3,4,5], 3) returns false
two_sum?([3,1,2,2,4], 3) returns true
=end

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

=begin
max_sub_array(a) Given an integer array a, find the contiguous subarray 
(containing at least one number) which has the largest sum and return its sum.
A subarray is a contiguous part of an array.
Example: 
unique_array([1]) returns 1
unique_array([5,4,-1,7,8]) returns 23
unique_array([-2,1,-3,4,-1,2,1,-5,4]) returns 6
=end
def max_sub_array(a)
  sum = a[0]
  maxsum = a[0]
  for index in 0..a.length-1
      sum = [a[index],sum+a[index]].max
      maxsum = [maxsum,sum].max
  end
  return maxsum
end

=begin
group_anagrams(a) Given an array of strings, group the anagrams together. 
You can return the answer in any order.
An Anagram is a word or phrase formed by rearranging the letters of a different word 
or phrase, typically using all the original letters exactly once.
Example: 
group_anagrams([""]) returns [[""]]
group_anagrams(["eat","tea","tan","ate","nat","bat"]) returns
[["bat"],["nat","tan"],["ate","eat","tea"]]
group_anagrams(["a"]) returns [["a"]]
=end
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

=begin
brackets_match?(s) Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid. An input string is valid if:
Open brackets must be closed by the same type of bracket.
Open brackets must be closed in the correct order.
	Example:
	is_valid(“()”) returns true
	is_valid("()[]{}") returns true
	is_valid("(]") returns false
	is_valid("([)]") returns false
	is_valid("{[]}") returns true
=end
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

=begin
remove_and_append_vowels(s) takes a string s representing a word as an argument and returns a string with all vowels of s removed and then appended to s. Characters are case-sensitive.
Example: 
remove_and_append_vowels(“Tree”) returns “Tree”
remove_and_append_vowels(“run”) returns “rnu”
remove_and_append_vowels(“Eyes”) returns “ysEe”
=end
def remove_and_append_vowels(s)
  vowels = s.scan(/[aeiouAEIOU]/)
  cons = s.scan(/[^aeiouAEIOU]/)
  return cons.join("") + vowels.join("")
end

=begin
highest_frequency_word(s) takes a string s that represents a sentence as an argument and returns the word (in lowercase) with highest frequency. If there is a tie, it returns the word that first appears earlier.
Example: highest_frequency_word(“Bob hit a ball; the hit BALL flew far after it was hit.”) returns “hit”
highest_frequency_word(“A man was painting a new sign for the pub called the Pig and Whistle.”) returns “a”
highest_frequency_word(“How are you doing?”) returns “how”
=end
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

# Class Implementation
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
    if dollars == 0
      return cents.to_s + " cents only"
    elsif cents == 0 
      return dollars.to_s + " dollars only"
    else 
      return dollars.to_s + " dollars and " + cents.to_s + " cents only"
    end
  end

end
