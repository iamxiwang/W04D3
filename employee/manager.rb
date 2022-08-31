require_relative "employee"

class Manager < Employee
    attr_accessor :boss

    def initialize(name, title, salary, boss, employees)
        super(name,title,salary,boss)
        @employees = employees
    end

    def bonus(multiplier)
        total_salary * multiplier   
    end

    protected

    def total_salary
        total = 0

        @employees.each do |employee|
            if employee.is_a?(Manager)
                total += employee.salary + employee.total_salary
            else
                total += employee.salary
            end
        end

        total  
    end
end

shawna = Employee.new("Shawna", "TA", 12000, nil)
david = Employee.new("David", "TA", 10000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, nil, [shawna, david])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])


darren.boss = ned
shawna.boss = darren
david.boss = darren

p ned.bonus(5)
# p darren.bonus(4)
# p david.bonus(3)


    