require_relative "employee"

class Manager < Employee
  attr_reader :employees
  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss = nil)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate
    subordinate
  end

  def bonus(multiplier)
    self.bonus_calculation * multiplier
  end
 
  private
  def bonus_calculation
    total_salary = 0
    self.employees.each do |subordinate|
      subordinate.is_a?(Manager) ? total_salary += subordinate.salary + subordinate.bonus_calculation : total_salary += subordinate.salary
    end
    total_salary
  end

end



# ned.bonus(5) # => 500_000
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000