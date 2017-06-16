require 'faker'





users = 20.times.map do
  User.create!( :name => Faker::Name.first_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end












