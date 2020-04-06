# https://www.facebook.com/vwalberton/posts/2926080467429002
# https://twitter.com/AkitaOnRails/status/1246448526411943936?s=20
# https://twitter.com/DaniloGentili/status/1246244786102833153?s=20
puts ">>>>starting loading records in Posts table<<<<"
(0..999).each do |n|
  print "."

  sma = SocialMediaAccount.all.sample

  if sma.profile_link.include?('twitter')
    link = "#{sma.profile_link}/status/#{Faker::Twitter.status[:id]}?s=20"
    content = Faker::Twitter.status[:text]
  else
    link = "#{sma.profile_link}/posts/#{Faker::Number.number(digits: 20)}"
    content = Faker::Lorem.paragraph(sentence_count: 3)
  end

  record = Post.find_by(:link => link)
  while record.present?
    if sma.profile_link.include?('twitter')
      link = "#{sma.profile_link}/status/#{Faker::Twitter.status[:id]}?s=20"
    else
      link = "#{sma.profile_link}/posts/#{Faker::Number.number(digits: 20)}"
    end
    record = Post.find_by(:link => link)
  end

  post = Post.create!(
    :social_media_account => sma,
    :post_date => Faker::Date.between(from: 2.months.ago, to: Date.today),
    :link => link,
    :content => content
  )
end
puts ""
puts "....ending the load of records in the Posts table...."
