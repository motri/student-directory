def input_students
  puts "Please enter the names of the students".center(20)
  puts "To finish, just hit return twice".center(20)

  students = Array.new

  name = $stdin.gets.chomp
  name.capitalize!
  puts "Please enter the age of the student:".center(20)
  age = $stdin.gets.chomp
    if age.empty?
      age = "Age not provided"
    end
  puts "Please enter the nationality of the student:".center(20)
  nationality = $stdin.gets.chomp
  if nationality.empty?
    nationality = "Nationality not provided"
  end
  puts "Joining which cohort?".center(20)
  cohort = $stdin.gets.chomp
  if cohort.empty?
    cohort = "Unknown"
  end


  while !name.empty? do
    students << {name: name, age: age, nationality: nationality, cohort: cohort}
    puts "Now we have #{students.count} students".center(20)
    name = $stdin.gets.chomp
    name.capitalize!
     if !name.empty?
       puts "Please enter the age of the student:".center(20)
       age = $stdin.gets.chomp
         if age.empty?
           age = "Age not provided"
         end
       puts "Please enter the nationality of the student:".center(20)
       nationality = $stdin.gets.chomp
       if nationality.empty?
         nationality = "Nationality not provided"
       end
       puts "Joining which cohort?".center(20)
       cohort = $stdin.gets.chomp
       if cohort.empty?
         cohort = "Unkown"
       end

     end
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(20)
  puts "-------------".center(20)
end

def print(students)
  students.each_with_index() {|student, index|
  puts "#{index.to_i + 1}. #{student[:name]}, #{student[:age]}, #{student[:nationality]} (#{student[:cohort]} cohort)".center(20)}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(20)
end

students = input_students
print_header
print(students)
print_footer(students)
