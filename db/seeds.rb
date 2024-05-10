require 'faker'

3.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

3.times do
  Event.create!(
    start_date: Faker::Time.forward(days: 23, period: :morning),
    duration: rand(1..24),
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    price: rand(1..100),
    location: Faker::Address.full_address
  )
end

puts "Événements créés avec succès !"
