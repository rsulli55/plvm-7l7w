puts "Hello, world."

ind = "Hello, Ruby".index("Ruby")
puts "The index of 'Ruby' is #{ind}"

x = 0
until x == 10
  x += 1
  puts "My name"
  puts "This is sentence #{x}"
end

correct_guess = false
puts "Guess a number between 1 and 10"
number = rand 10
until correct_guess
  guess = gets.to_i
  correct_guess = guess == number
  if guess < number
    puts "Your guess was too low"
  elsif guess > number
    puts "Your guess was too high"
  end
end
puts "You got it!"


