#
# Laboratorio 2. Piedra, Papel, Tijeras, Largaro o spock
#

class Rpsls
  
  attr_reader :computer_choice, :human_choice

  def initialize()
    @beats = {:rock => [:scissors, :lizard], :paper => [:rock, :spock], :scissors => [:paper, :lizard], :lizard => [:paper, :spock], :spock => [:rock, :scissors]}
  end

  def human_choice(choice)
    human_choice = (choice || '').to_sym
    if @beats.keys.include? human_choice
      @human_choice = human_choice
    end 
  end

  def cumputer_choice()
    @computer_choice = @beats.keys.sample
  end

  def play(choice)
    
    human_choice(choice)
    cumputer_choice()
    puts @human_choice
    puts @computer_choice

    if @beats[@computer_choice].include? @human_choice
      winner = "Humano"
    elsif @beats[@human_choice].include? @computer_choice
      winner = "Ordenador"
    else
      winner = "Ninguno"
    end

    winner
  end
end



