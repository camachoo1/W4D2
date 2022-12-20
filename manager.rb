require_relative "employee"

class Manager < Employee
  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss = nil)
    @employees = []
  end

  def add_employee(subordinates)
    employees << subordinates
  end
end