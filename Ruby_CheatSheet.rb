# comments in Ruby start with a #
=begin
multiline comments
are written like this
=end

#Working with strings
var = "  Shonil Bhide  "
# >>   Shonil Bhide  
puts var
var = var.strip
# >> SHONIL BHIDE
puts var.upcase
#>> SHONIL BHIDE
puts var.downcase
#>> shonil bhide
puts var.length
#>> 12
puts var.include? "Bhide"
#>> true
puts var.include? "bhide"
#>> false
puts var[0]
#>> S
puts var[0,4]
#>> Shon
puts var[2,5]
#>> onil
puts var.index("Bhide")
#>> 7 


#GETTING INPUTS
name = gets
puts ("Hello" + name)
#>> Shonil
#>> HelloShonil

puts "Enter your name"
name = gets
puts ("Hello " + name + ", How are you?")
=begin
Hello Shonil
, How are you?
=end

puts "Enter your name"
name = gets.chomp()
puts ("Hello " + name + ", How are you?")
# >> Hello Shonil, How are you?
# .chomp() is used to remove the extra line(/n symbol) which is added after the gets srting by default


#Working with numbers
num = 2
puts num
#>> 2
num = 4.7
puts num
#>> 4.7
num = num.to_i
puts num
#>> 4
num = num.to_f
puts num
#>> 4.0
# to_i converts to integer and to_f converts to float


#Arrays:
fruits = Array["Mango","Apple","Orange"]
# An array is Defined by using the keyword Array where A is capital
puts fruits
=begin
Mango
Apple
Orange
=end
arr1 = [1,"name", true]
puts arr1
=begin
1
name
true
=end
puts fruits [0]
#>> Mango
puts fruits [0,2]
=begin
Mango
Apple
=end
puts fruits[1,2]
=begin
Apple
Orange
=end
fruits[0] = "Watermelon"
puts fruits
=begin
Watermelon
Apple
Orange
=end
arr2 = Array.new
puts arr2
#>>
# Array.new is used to initialize an empty array

arr2[0]= 1
arr2[5] = 3
puts arr2
=begin
1




3
=end
print arr2
# [1, nil, nil, nil, nil, 3]
puts fruits.include? "Mango"
#>> false
puts fruits.include? "Apple"
#>> true
print fruits.reverse
#>> ["Orange", "Apple", "Watermelon"]
print fruits
#>> ["Watermelon", "Apple", "Orange"]

print fruits.sort
#>> ["Apple", "Orange", "Watermelon"]

print arr1.sort
=begin
helloworld.rb:132:in `sort': comparison of String 
with 1 failed (ArgumentError)
from helloworld.rb:132:in `<main>'
=end

# sort and reverse does not upat the actual array
# you cannot sort arrays having elements with mixed datataypes




#HASHES:

states = {
    "Pennsylvania" => "PA",
    "New York" => "NY",
    "North Carolina" => "NC"
}
print states
#{"Pennsylvania"=>"PA", "New York"=>"NY", "North Carolina"=>"NC"}
puts states["Pennsylvania"]
#PA
states1 = {
    :Pennsylvania => "PA",
    :NewYork => "NY",
    :NorthCarolina => "NC"
}
puts states1[:Pennsylvania]
#PA


#Methods

def sayhi
    puts "Hello User"
end
sayhi
#Hello User
def sayhiname(name = "Sho")
    puts "Hello " + name
end
sayhiname()
#Hello Sho
sayhiname("Shonil")
#Hello Shonil

def rtutn(num)
    num
end
puts rtutn(4)
# 4
def rtutn1(num)
    num
    5
end
puts rtutn1(4)
#5
def rtutn2(num)
    return num
    5
end
#4
puts rtutn2(4)
def rtutn3(num)
    return num,5
end
print rtutn3(4)
#[4, 5]


# IF STATEMENTS

=begin
if condition
    true statement action
elsif condition
    elseif statement actio
.
.
else
    else statement action
end

conditions: cond1 and cond2; ismale(bool value);cond 1 or cond2;
            !istall 

=end

#Case:
=begin
case name
    when val1
        val = value1
    when val2
        val = value2
    else
        val = "Invalid"
    return val
end
=end

#While loop
=begin
index = 1
while condition(index <=5)
    looping code
    index += 1
=end

#For loop
=begin
for i in array_name
    looping code
end
=end
#it can be also written as:
=begin
array_name.each do |i|
    looping code
end
=end

for index in 0..5
    print index
end
# 012345

6.times do |index|
    print index
end
#012345

#File operations
=begin
r/w modes:
r -> read only, starts at beginnning (default)
r+ -> read-write, starts at beginning
w -> write only, truncates existing file to 0 len or creates new file
w+ -> read/write, truncates existing file to 0 len or creates new file
a -> write-only, starts at eof or creates new
a+ -> read-write, starts at eof or creates new
b -> binary file mode
t-> text file mde
=end
File.open("abc.txt","r") do |file|
    print file
    #<File:0x000001db82207538>
    print file.readline()
    # 1,Mango
    print file.readchar()
    # 2
    for line in file.readlines()
        print line
    end
    #, Apple
    #3, Watermelon
    file.close()
end

File.open("abc.txt","a") do |file|
    file.write("\n4,Grapes")
    file.close()
end

File.open("index.txt","w") do |file|
    file.write("<h1>Hello</h1>")
    file.close()
end


#Exception handling:
=begin
begin
    actual code which might break
rescue
    exception handling
end


resue ZeroDivisionError
rescue TypeError => e
=end


