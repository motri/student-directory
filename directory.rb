def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create and empty array, I like to use Array.new
  students = Array.new
  #we ask for the first by using old gets.chomp

  name = $stdin.gets.chomp
  puts "Joining which cohort?"
  cohort = $stdin.gets.chomp
  # now we create the condition for our program to either store or finish
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = $stdin.gets.chomp
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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
