# Part a)
class NoSuchCurrencyError < StandardError ; end

class Numeric
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
	def in(currency)
 		singular_currency = currency.to_s.gsub( /s$/, '')

 		raise NoSuchCurrencyError unless @@currencies.has_key?(singular_currency)
		
		self * @@currencies[singular_currency]
	end

	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub( /s$/, '')
		if @@currencies.has_key?(singular_currency)
			self * @@currencies[singular_currency]
		else
     		super
   		end
 	end
end

puts 12.yen
puts 12.dollars
puts 10.euros
puts

puts 1.dollars.in(:dollars)
puts 1.yen.in(:dollars)
# puts 1.yen.in(:japan)
puts

# Part b)
class String
	def palindrome?
		string = self[/[a-zA-Z]/].downcase

		string == string.reverse
	end
end

def palintest(number, string)
	if string.palindrome?
		print("PalinTest#{number}: Success\n")
	else
		print("PalinTest#{number}: Failed\n")
	end
end

palintest(1, "Abracadabra")
palintest(2, "Madam, I'm Adam!")
palintest(3, "A man, a plan, a canal -- Panama")

# part c)

module Enumerable
	def palindrome?
		forward = self.each
		backward = self.reverse_each

		loop do
			return false unless forward.next == backward.next
		end

		true
	end
end


def test_enumurable
	print "TestEnum: "

	if [1,2,3,2,1].palindrome?
		puts "Success"
	else
		puts "Failed"
	end
end

def test_palindrome_hash
    print "TestPalinHash: "
    { "a" => 1, "b" => 2, "c" => 1 }.palindrome?
   	puts "Success"
end

test_enumurable
test_palindrome_hash