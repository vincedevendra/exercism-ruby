class School
  VERSION = 1

  def initialize
    @students = Hash.new([]) 
  end

  def add(name, grade)
    @students[grade] += [name]
    @students[grade] = @students[grade].flatten.sort
  end

  def to_h
    @students.sort.to_h
  end

  def grade(grade)
    @students[grade]
  end
end
