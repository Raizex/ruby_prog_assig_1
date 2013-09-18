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

