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

    @human_choice = nil

    if choice.class == String
      human_choice = (choice || '').to_sym
      if @moves_available.include? human_choice		# si choice es una jugada valida la guaramos en @human_choice convertida en simbolo
        @human_choice = human_choice
      end
    
    else
      raise "You must give me a move in a string." # lanzamos una excepción porque choice no es un string
    end
  end

  def cumputer_choice()
    @computer_choice = @moves_available.sample
  end

  def play(choice)
    
    human_choice(choice)	# le damos un valor esperado a @human_choice
    cumputer_choice()		# le damos un valor esperado a @computer_choice

    if @human_choice != nil
      # preparamos el resultado a mostrar
      if @beats[@computer_choice].include? @human_choice
        result = "Computer wins. #{@computer_choice.capitalize} beats #{@human_choice.capitalize}."
      elsif @beats[@human_choice].include? @computer_choice
        result = "Human wins. #{@human_choice.capitalize} beats #{@computer_choice.capitalize}."
      else
        result = "It's a draw."
      end

    else
      result = "You must give me a valid move. Select one of them: #{@moves_available.join(', ')}."
    end

    result	# retornamos el resultado
  end
end



