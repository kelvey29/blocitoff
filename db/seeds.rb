require 'faker'
include Faker

#generate items
20.times do
   Item.create!(
       :name => Faker::Hipster.words(4).join(' '),
       :user_id => Faker::Number.between(1, 10)
   ) 
end

#generate users
10.times do
   User.create!(
      :email => Faker::Internet.email,
      :password => Faker::Internet.password(8),
      :confirmed_at => Faker::Time.between(DateTime.now - 1, DateTime.now)
   )
end
   
puts "Seed finished"

puts "#{Item.count} items created"
puts "#{User.count} users created"