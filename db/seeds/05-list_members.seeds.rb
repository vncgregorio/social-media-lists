puts ">>>>starting loading records in List Members table<<<<"
(0..299).each do |n|
  print "."
  person = Person.all.sample
  list = List.all.sample

  record = ListMember.find_by(:person => person, :list => list)
  while record.present?
    person = Person.all.sample
    list = List.all.sample
    record = ListMember.find_by(:person => person, :list => list)
  end

  member = ListMember.create!(
    :person => person,
    :list => list
  )
end
puts ""
puts "....ending the load of records in the List Members table...."
