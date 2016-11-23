require './rice_test'

(1...6).each do |n| 
	puts "fib(#{n}): #{RiceTest.new.fibonacci(n)}"
end