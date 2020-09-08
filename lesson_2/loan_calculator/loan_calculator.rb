def clear_screen
  system("clear") || system("cls")
end

def prompt(message)
  puts "=> #{message}"
end

# prints a horizontal line for text seperation
def hr(number, char='-')
  puts char * number
end

# adds vertical clearance
def spacer(lines=1)
  lines.times { puts }
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def retrieve_loan_amount
  prompt("Enter the loan amount please:")
  loop do
    amount = gets.chomp
    break amount if float?(amount) && amount.to_f > 0
    prompt("Enter a positive amount please.")
  end
end

def retrieve_apr
  spacer
  prompt("Enter the Annual Percentage Rate (APR) please:")
  prompt("Enter 3.5 for 3.5%, 0.5 for 0.5%")
  loop do
    apr = gets.chomp
    break apr if float?(apr) && apr.to_f > 0
    prompt("Enter a positive APR please.")
  end
end

def retrieve_duration
  spacer
  prompt("Enter the loan duration (in months) please:")
  loop do
    duration = gets.chomp
    break duration if integer?(duration) && duration.to_i > 0
    prompt("Enter a valid number please.")
  end
end

def display_new_calc
  hr(40)
  spacer
  prompt("Do you want another calculation? (y/yes or n/no)")
end

def retrieve_new_calc_answer
  loop do
    answer = gets.chomp.downcase
    break answer if ['y', 'yes', 'n', 'no'].include?(answer)
    prompt("Invalid input, please enter either 'y', yes' or 'n', no'")
  end
end

def calculate_monthly_payment(loan, apr, duration)
  loan.to_f * (apr / (1 - (1 + apr)**-duration.to_i))
end

def display_monthly_payment(payment)
  hr(40)
  spacer
  prompt("Monthly payment: $#{format('%.2f', payment)}")
  spacer
end

def new_calculation?(answer)
  answer == 'y' || answer == 'yes'
end

clear_screen
prompt("Welcome to Mortgage Loan Calculator!")
hr(40, '=')
spacer
first_calculation = true

# main loop
loop do
  clear_screen unless first_calculation

  loan_amount = retrieve_loan_amount
  apr = retrieve_apr
  duration_in_months = retrieve_duration

  monthly_interest_rate = (apr.to_f / 100) / 12

  monthly_payment = calculate_monthly_payment(
    loan_amount,
    monthly_interest_rate,
    duration_in_months
  )

  display_monthly_payment(monthly_payment)

  display_new_calc
  answer = retrieve_new_calc_answer
  break unless new_calculation?(answer)

  first_calculation = false
end

spacer(1)
prompt("Thanks for using Loan Calculator, hope to see you again!")
