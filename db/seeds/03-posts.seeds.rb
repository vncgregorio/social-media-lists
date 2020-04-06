# https://www.facebook.com/vwalberton/posts/2926080467429002
# https://twitter.com/AkitaOnRails/status/1246448526411943936?s=20
# https://twitter.com/DaniloGentili/status/1246244786102833153?s=20
puts ">>>>starting loading records in Posts table<<<<"
(0..999).each do |n|
  print "."

  images = [
    'https://picsum.photos/id/1/300/200',
    'https://picsum.photos/id/100/300/200',
    'https://picsum.photos/id/1026/300/200',
    'https://picsum.photos/id/1027/300/200',
    'https://picsum.photos/id/400/300/200',
    'https://picsum.photos/id/780/300/200',
    'https://picsum.photos/id/945/300/200',
    'https://picsum.photos/id/1005/300/200',
    'https://picsum.photos/id/103/300/200',
    'https://picsum.photos/id/104/300/200',
    'https://picsum.photos/id/1047/300/200',
    'https://picsum.photos/id/1053/300/200',
    'https://picsum.photos/id/1004/300/200',
  ]

  sma = SocialMediaAccount.all.sample

  image_link = [true, false].sample ? images.sample : nil

  if sma.profile_link.include?('twitter')
    link = "#{sma.profile_link}/status/#{Faker::Twitter.status[:id]}?s=20"
    content = Faker::Twitter.status[:text]
  else
    link = "#{sma.profile_link}/posts/#{Faker::Number.number(digits: 20)}"
    content = Faker::Lorem.paragraphs(number: rand(2..8)).join('\n')
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
    :content => content,
    :image_link => image_link
  )
end
puts ""
puts "....ending the load of records in the Posts table...."
