puts ">>>>starting loading records in Social Media Accounts table<<<<"
networks = ['facebook', 'twitter']
(0..249).each do |n|
  print "."

  person = Person.all.sample
  network = networks.sample
  username = Faker::Internet.username(specifier: person.name, separators: %w(. _ -))

  profile_link = "https://www.#{network}.com/#{username}"

  record = SocialMediaAccount.find_by(:profile_link => profile_link)
  while record.present?
    username = Faker::Internet.username(specifier: 6..12, separators: %w(. _ -))
    profile_link = "https://www.#{network}.com/#{username}"
    record = SocialMediaAccount.find_by(:profile_link => profile_link)
  end

  sma = SocialMediaAccount.create!(
    :person => person,
    :network => network,
    :username => username,
    :profile_link => profile_link
  )
end
puts ""
puts "....ending the load of records in the Social Media Accounts table...."
