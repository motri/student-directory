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



# previous script#
#better store the students in an array
#students = [
#  {name: "Dr. Hannibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Krueger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
#]
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
