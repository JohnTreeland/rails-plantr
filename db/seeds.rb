# Borro todos los bookings
Booking.destroy_all
# Borro todos los sitters
Sitter.destroy_all
# Borro todos los usuarios
User.destroy_all

cities = %w[Medellin Envigado Sabaneta]

# Creación de los usuarios (5)
9.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    address: Faker::Address.full_address,
    city: cities.sample,
    sitter: [true, false].sample
  )
  user.save
  p "User saved"
end

p "random users created"

# Usuario para la demo

romario = User.create!(
  email: 'roma@mes.com',
  password: "123456",
  password_confirmation: "123456",
  first_name: 'Romario',
  last_name: 'Mestra',
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  address: Faker::Address.full_address,
  city: 'Medellin',
  sitter: true
)

# Sitters que le pertenecen a Romario

random_day = (2..30).to_a
month = (0..2).to_a

User.all.each do |user|
  start_date = Date.today + (month.sample * 30) + random_day.sample
  if user.sitter
    Sitter.create!(
      user: user,
      start_date: start_date,
      end_date: start_date + random_day.sample + (month.sample * 30)
    )
  end
end
