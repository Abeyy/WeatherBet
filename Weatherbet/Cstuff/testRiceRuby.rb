require "/Users/_-_/Documents/Poly/Poly Fall 2016/Software EG/Weatherbet/untitled folder/WeatherBet-Rails-/Weatherbet/Cstuff/rice_test"

puts RiceTest.new.hello
(1...6).each do |n| 
	puts "fib(#{n}): #{RiceTest.new.fibonacci(n)}"
end


(1...6).each do |n| 
	puts "laplace(#{n},#{n}): #{RiceTest.new.laplace(n,n)}"
end

puts "4! = #{RiceTest.new.factorial(4)}"

puts "test stats:"

@stat = WbStat.new

@stat.total = 12 


(0...13).each do |x|

	@stat.correct = x

	puts "with #{@stat.correct} correct predictions out of #{@stat.total} predictions a user would have a weight of:"
	puts "\tusing the MLE method: #{@stat.mle()}"
	puts "\tusing the LaPlace method: #{@stat.laplace()}"
	puts "\tusing the Jeffreys method: #{@stat.jeffreys()}"
	puts "\tassuming a mean of 0.5 and std_div 0.2 the zscore is #{@stat.zscore(@stat.mle, 0.5, 0.2)}}"
	puts ""

end
