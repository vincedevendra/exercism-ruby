class WordProblem
  OPERATORS = { "plus" => :+, "minus" => :-,
              "divided" => :/, "multiplied" => :*  }
  SCAN_PATTERN = /-?\d+|#{OPERATORS.keys.join('|')}/

  def initialize(word_problem)
    @word_problem = word_problem
  end

  def answer
    expression_elements = @word_problem.scan(SCAN_PATTERN).map do |element|
      OPERATORS.fetch(element) { element }
    end

    raise ArgumentError unless expression_elements.size >= 3
    eval(expression_elements.join)
  end
end
