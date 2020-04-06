puts ">>>>starting loading records in Lists table<<<<"
(0..7).each do |n|
  print "."
  descriptions = [
    'analysis',
    'health-care',
    'home-defense',
    'agriculture',
    'security',
    'technology',
    'companies',
    'culture',
    'tourism',
    'politics',
    'foreign-exchange',
    'world',
    'environment'
  ]
  name = "#{Faker::Date.between(from: 2.months.ago, to: Date.today).strftime('%Y%m%d')}-#{descriptions.sample}"

  record = List.find_by(:name => name)
  while record.present?
    name = "#{Faker::Date.between(from: 2.months.ago, to: Date.today).strftime('%Y%m%d')}-#{descriptions.sample}"
    record = List.find_by(:name => name)
  end

  list = List.create!(
    :name => name
  )
end
puts ""
puts "....ending the load of records in the Lists table...."
