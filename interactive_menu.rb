@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

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
    @students << {name: name, age: age, nationality: nationality, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
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
end

def print_students_list
  if @students.empty?
    print_header
    interactive_menu
  else
    print_header
    puts @students
  end
end

def print_students_list_by_range
  if @students.empty?
    print_header
    interactive_menu
  else
    puts "Select category to search:"
    category = gets.chomp.downcase
    puts "Which range:"
    range = $stdin.gets.chomp
    print_header
    @students.map do |x|
      x.each_key do |k, y|
        puts x[:name] if x[k] == range
     end
   end
 end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:age], student[:nationality], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show all students"
  puts "3. Show students by category"
  puts "4. Save student list"
  puts "9. Exit"
end

def show_students
  print_students_list
  print_footer
end

def show_students_by_range
  print_students_list_by_range
  print_footer
end

def print_header
  if @students.empty?
    puts "No student information provided."
  else
    puts "The students of Villains Academy"
    puts "-------------"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    show_students_by_range
  when "4"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

interactive_menu
