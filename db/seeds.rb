# Borro todos los bookings
Booking.destroy_all
# Borro todos los sitters
Sitter.destroy_all
# Borro todos los usuarios
User.destroy_all

cities = %w[Medellin Envigado Sabaneta]

# Creación de los usuarios (5)
4.times do
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

for i in 0..3 do
  sitter = Sitter.create(
    user_id: romario.id,
    start_date: Date.today + (30*i),
    end_date: Date.today + 5 + (30*i)
  )
  sitter.save
end

# Bookings a romario como sitter

for i in 0..1 do
  booking = Booking.create(
    user_id: User.all[User.first.id + i],
    sitter_id: Sitter.first.id,
    start_date: Sitter.first.start_date,
    end_date: Sitter.first.end_date,
    plants_quantity: (1..15).to_a.sample
  )
  booking.save
end
