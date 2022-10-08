# Borro todos los bookings
Booking.destroy_all
# Borro todos los sitters
Sitter.destroy_all
# Borro todos los usuarios
User.destroy_all
puts "previous db destroyed"

cities = %w[Medellín Envigado Itagüí]

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
end

puts "9 Random users created"

# Usuario para la demo

User.create!(
  email: 'roma@mes.com',
  password: "123456",
  password_confirmation: "123456",
  first_name: 'Romario',
  last_name: 'Mestra',
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  address: Faker::Address.full_address,
  city: 'Medellín',
  sitter: true
)

puts "Romario created"

# Descripciones de los sitters

description_1 = "Me encanta hablarle a las plantas, yo a las mías les hablo todo el día. Amo cuidarlas y conectar con ellas. Como tengo muchas plantas de interior, prefiero cuidar este tipo de plantas, con las exterior no me llevo tan bien. Mi planta favorita es el Palo de Agua."
description_2 = "No hay nada que prefiera más que cuidar de las plantas, yo estudié botánica y en mis ratos libres o vacaciones me gusta cuidar plantas ajenas. Sé como cuidarlas muy bien y ponerlas muy lindas, sé de sustratos y cuidados expertos gracias a mi profesión."
description_3 = "Yo nací en el campo y desde hace mucho tiempo he cuidado las plantas de mi casa, tanto adentro como afuera. Puedes confiar en mí para el mejor cuidado de tus plantas mientras tú no estás disponible para ellas."

descriptions = [description_1, description_2, description_3]
random_day = (2..30).to_a
month = (0..2).to_a

User.all.each do |user|
  start_date = Date.today + (month.sample * 30) + random_day.sample
  if user.sitter
    Sitter.create!(
      user: user,
      start_date: start_date,
      end_date: start_date + random_day.sample + (month.sample * 30),
      description: descriptions.sample,
      city: cities.sample
    )
  end
end

puts "Sitters added"
