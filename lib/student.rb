class Student
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    sql =  <<-SQL
        CREATE TABLE IF NOT EXISTS students (
          id INTEGER PRIMARY KEY,
          name TEXT,
          grade TEXT
          )
          SQL
      DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
        DROP TABLE students
        SQL
      DB[:conn].execute(sql)
  end

  def save
    #binding.pry
    DB[:conn].execute("INSERT INTO students (name, grade) VALUES (#{self.name}, #{self.grade})")
  end

  def self.create(name:, grade:)
    binding.pry
    student = self.new
    student.send("#{name}=", value)
    DB[:conn].execute("SELECT * FROM students")
  end
end
