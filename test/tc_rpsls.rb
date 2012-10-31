#
# tc_rpsls.rb
# Unit Testing for Class Rpsls
#

require "rpsls"
require "test/unit"

class TestRpsls < Test::Unit::TestCase
  
  def setup
    @rpsls = Rpsls.new
  end
  
  # test para comprobar que si no recibe el tipo de dato esperazo se lanza una excepcion
  def test_datatype
    assert_raise(RuntimeError) { @rpsls.play(:symbol) }
    assert_raise(RuntimeError) { @rpsls.play({}) }
    assert_raise(RuntimeError) { @rpsls.play(21) }
  end
  
  # metodo necesario para el test de repuesta valida
  def valid_answer(result)
    return true if (result =~ /Human wins. (\w+) beats (\w+)./) 
    return true if (result =~ /Computer wins. (\w+) beats (\w+)/)
    return true if (result =~ /It's a draw./)
    return true if (result =~ /You must give me a valid move. Select one of them: *./)
  end

  # test para comprobar si la respuesta obtenida es valida, que no correcta
  def test_valid_answer
    20.times do
      assert valid_answer(@rpsls.play('rock'))
    end
    20.times do
      assert valid_answer(@rpsls.play('paper'))
    end
    20.times do
      assert valid_answer(@rpsls.play('scissors'))
    end
    20.times do
      assert valid_answer(@rpsls.play('lizard'))
    end
    20.times do
      assert valid_answer(@rpsls.play('spock'))
    end

    20.times do
      assert valid_answer(@rpsls.play('invalid_choice'))
    end

  end
  
  # test para comprobar que el ordenador al menos una vez cada una de las jugadas
  def test_computer_choice

    computer_choices = []
    100.times do
      @rpsls.play('spock')
      computer_choices.push(@rpsls.computer_choice)
    end

    assert (computer_choices.uniq.length == 5)
  end
  
end