puts ">>>>starting loading records in Networks table<<<<"

print "."
facebook = Network.create!(
  :name => 'facebook',
  :icon => 'fa fa-facebook-square btn btn-primary',
)

print "."
twitter = Network.create!(
  :name => 'twitter',
  :icon => 'fa fa-twitter btn btn-info',
)

puts ""
puts "....ending the load of records in the Networks table...."
