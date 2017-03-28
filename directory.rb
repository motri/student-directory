def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = Array.new

  name = $stdin.gets.chomp
  name.capitalize!
  puts "Joining which cohort?"
  cohort = $stdin.gets.chomp

  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = $stdin.gets.chomp
    name.capitalize!
     if !name.empty?
       puts "Joining which cohort?"
       cohort = $stdin.gets.chomp
     end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index() {|student, index|
  puts "#{index.to_i + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12 }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
