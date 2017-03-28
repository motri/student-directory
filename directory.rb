def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = Array.new

  name = $stdin.gets.chomp
  name.capitalize!
  puts "Please enter the age of the student:"
  age = $stdin.gets.chomp
  age = "Age not provided" if age.empty?
  puts "Please enter the nationality of the student:"
  nationality = $stdin.gets.chomp
  nationality = "Nationality not provided" if nationality.empty?
  puts "Joining which cohort?"
  cohort = $stdin.gets.chomp
  cohort = "unknown" if cohort.empty?
  months = %w(january february march april may june july august september october november december unknown)
  while !months.include? cohort.downcase
    puts "cohort not recognised, please enter again"
    cohort = $stdin.gets.chomp
  end

  while !name.empty? do
    students << {name: name, age: age, nationality: nationality, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end

    name = $stdin.gets.chomp
    name.capitalize!
     if !name.empty?
       puts "Please enter the age of the student:"
       age = $stdin.gets.chomp
         if age.empty?
           age = "Age not provided"
         end
       puts "Please enter the nationality of the student:"
       nationality = $stdin.gets.chomp
       if nationality.empty?
         nationality = "Nationality not provided"
       end
       puts "Joining which cohort?"
       cohort = $stdin.gets.chomp
       if cohort.empty?
         cohort = "Unkown"
       end

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
  puts "#{index.to_i + 1}. #{student[:name]}, #{student[:age]}, #{student[:nationality]} (#{student[:cohort]} cohort)"}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
