require './lib/shuffle'

words = %w"book reading tutorial first nerd love twitter sunday bitter sweet hello"
point = 0
word = words[rand(words.length - 1)]

puts `clear`
puts 'Welcome to random word game!'
puts '--------------------------------------'
puts 'type your guess word and enter to answer'
puts 'type \q to quit from game'
puts 'type \add firstword secondword to add'
puts 'new word, e.g \add library lamp hell'
puts '--------------------------------------'
puts 'Guess this random word : '+ word.shuffle

while true
  char = gets.chomp

  # quit or all word guessed
  if char == '\quit' || words.length == 0
    puts "Bye! Your point : #{point}"
    break
  end

  # correct word goes here
  if char == word
    point += 1
    words.delete word

    puts 'Correct!'
    puts "Your current point : #{point}"
    puts '-----------------------------'

    word = words[rand(words.length - 1)]
    break if word.nil?
    puts 'Guess this random word : '+ word.shuffle

  # add new word
  elsif char[0..3] == '\add'
    new_words = char[4..-1].split(" ")
    words.concat new_words
    puts "Added!"

  # wrong answer
  else
    puts 'Wrong!'
  end
end
