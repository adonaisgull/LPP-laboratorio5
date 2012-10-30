#
# rpsls.rb
# Class Rpsls
#

class Rpsls
  
  attr_reader :computer_choice, :human_choice

  def initialize()
    @beats = {:rock => [:scissors, :lizard], :paper => [:rock, :spock], :scissors => [:paper, :lizard], :lizard => [:paper, :spock], :spock => [:rock, :scissors]}
    @moves_available = @beats.keys
  end

  def human_choice(choice)
    human_choice = (choice || '').to_sym
    if @moves_available.include? human_choice
      @human_choice = human_choice
    else
      @human_choice = nil
    end 
  end

  def cumputer_choice()
    @computer_choice = @moves_available.sample
  end

  def play(choice)
    
    human_choice(choice)
    cumputer_choice()

    if @human_choice == nil
      result = "You must select a valid move. These moves are available: #{@moves_available.join(', ')}."
    else
      if @beats[@computer_choice].include? @human_choice
        result = "Computer wins. #{@computer_choice.capitalize} beats #{@human_choice.capitalize}."
      elsif @beats[@human_choice].include? @computer_choice
        result = "Human wins. #{@human_choice.capitalize} beats #{@computer_choice.capitalize}."
      else
        result = "It's a draw."
      end
    end

    result
  end
end



