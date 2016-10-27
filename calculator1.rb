#take first number
#take modifier
#take last number
#puts result
#error checking
#user input and modifiers should be checked for proper input type
#result should set first_number and allow for another modifier and last number so result continues to build until the user decides to clear the calculator
#- make + - * / work
#- make clear work



puts "WELCOME TO RUBY CALCULATOR"

def main_menu
  puts "~~~ Main Menu ~~~"
  puts "1: Make A Calculation"
  puts "2: Exit"
end

def num1
  puts "Input first number"
  number = gets.strip.to_f
  number
end

def num2(modifier)
  puts "Input second number"
  number = gets.strip.to_f
  if modifier == "/" && number == 0
    puts "You cant divide by 0"
    num2(modifier)
  else
    number
  end
end

def mod1
  puts "Input modifier (+, -, *, or /)"
  modifier = gets.strip.downcase
  case modifier
  when "+"
    "+"
  when "-"
    "-"
  when "*"
    "*"
  when "/"
    "/"
  else
    puts "Invalid Input"
    mod1
  end
end



def calculate(x, y, z)
  case y
  when "+"
    puts "#{x} + #{z} = #{x + z}"
    x + z
  when "-"
    puts "#{x} - #{z} = #{x - z}"
    x - z
  when "*"
    puts "#{x} * #{z} = #{x * z}"
    x * z
  when "/"
    puts "#{x} / #{z} = #{x / z}"
    x / z
  end

end

def menu_selection
  selection = gets.strip
  case selection
  when "1"
    puts "Lets get started!"
  when "2"
    exit
  else
    puts "Invalid Input"
    main_menu
    menu_selection
  end
end

def continuing(first_answer)
  puts "\nLast answer was #{first_answer}."
  puts "Input modifier (+, -, *, / or clear)"
  new_modifier = gets.strip.downcase
  case new_modifier
  when "+", "-", "*", "/"
  when "clear"
    run_calc
  else
    puts "Invalid Modifer"
    continuing(first_answer)
  end
  print "Enter another number: "
  new_number = gets.strip.to_f
  case new_modifier
  when "+"
    puts "#{first_answer} + #{new_number} = #{first_answer + new_number}"
    new_answer = first_answer + new_number
  when "-"
    puts "#{first_answer} - #{new_number} = #{first_answer - new_number}"
    new_answer = first_answer - new_number
  when "*"
    puts "#{first_answer} * #{new_number} = #{first_answer * new_number}"
    new_answer = first_answer + new_number
  when "/"
    puts "#{first_answer} / #{new_number} = #{first_answer / new_number}"
    new_answer = first_answer / new_number
  end
  continuing(new_answer)
end

def run_calc
  while true
    main_menu
    menu_selection
    number1 = num1()
    modifier = mod1()
    number2 = num2(modifier)
    #calculate(number1, modifier, number2)
    continuing(calculate(number1, modifier, number2))

  end
end

run_calc
