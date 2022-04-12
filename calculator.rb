class Calculator
  def initialize
    puts "Escolha a operação matemática \n 1 - Adição \n 2 - Subtração \n 3 - Divisão \n 4 - Multiplicação \n 5 - Porcentagem \n "
    @operator = gets.chomp().to_i
    puts "\n \n Digite o primeiro valor"
    @value = gets.chomp()
    puts "\n \n Digite o segundo valor"
    @value2 = gets.chomp()
    
  end

  def validations()
    value_validator = (String(Integer(@value)) =~ /^-?[0-9]+$/ && String(Integer(@value2)) =~ /^-?[0-9]+$/)
    # value_validator = (@value.kind_of?Integer && @value2.kind_of?Integer)

    if (@operator > 5 || @operator < 1) 
      value_validator = false
    end

    if !(value_validator) 
      error_message("Digito(s) invalidos(s)")
      exit(true)
    end

    result_calc()
  end

  def result_calc

    value = Float(@value)
    value2 = Float(@value2)

    @result = case @operator
      when 1
        value + value2
      when 2
        value - value2
      when 3
        value / value2
      when 4
        value * value2
      when 5
        (value * value2)/100
    end
    puts "_________________________________________________"
    puts "O resultado final é : #{@result}"
  end
  private

  def error_message(mensage)
    puts "Error: #{mensage}"
    return
  end
end
calculadora = Calculator.new
calculadora.validations()