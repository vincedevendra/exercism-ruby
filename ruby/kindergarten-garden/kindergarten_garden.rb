class Garden
  DEFAULT_STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana
                        Joseph Kincaid Larry)
  DECODER = {"R" => :radishes, "C" => :clover, "G" => :grass, "V" => :violets }

  def initialize(diagram, students = nil)
    @diagram = diagram
    @students = students&.sort || DEFAULT_STUDENTS
    define_methods_for_students
  end

  private

  def define_methods_for_students
    @students.each_with_index do |student, i|
      define_singleton_method(student.downcase.to_sym) do
        find_and_decode_letters(student, i)
      end
    end
  end

  def find_and_decode_letters(student, i)
    @diagram.split("\n").map do |line|
      [line[2*i], line[(2*i)+1]].map { |letter| DECODER[letter] }
    end.flatten
  end
end
