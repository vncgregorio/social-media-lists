puts ">>>>starting loading records in People table<<<<"
(0..99).each do |n|
  print "."
  person = Person.create!(:name => Faker::Name.name)
end
puts ""
puts "....ending the load of records in the People table...."
