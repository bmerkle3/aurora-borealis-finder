require 'faker'

User.delete_all



users = 20.times.map do
  User.create!( :name => Faker::Name.first_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

items = 50.times.map do
  Item.create!( name: Faker::Team.creature,
                user_id: Faker::Number.between(1, 100),
                condition:  Faker::Lorem.word,
                description: Faker::Team.sport,
                start_time: Faker::Time.between(2.days.ago, Date.today, :night),
                end_time: Faker::Time.forward(23, :morning)
    )
end

users.each do |user|
  user_bids = items.sample(rand(2..4))
  user_bids.each do |item|
    Bid.create!(bidder: user,
                item: item,
                amount: Faker::Number.decimal(2))
  end
end








