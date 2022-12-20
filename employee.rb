class Employee
  attr_reader :name, :salary, :title
  attr_accessor :boss

  def initialize(name, salary, title, boss = nil)
    @name, @salary, @title = name, salary, title
    self.boss = boss
  end


end