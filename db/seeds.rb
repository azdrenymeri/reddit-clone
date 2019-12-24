# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'azdreny@gmail.com',
            password: '123456',
            full_name: 'Azdren Ymeri',
            bio: 'This is Azdren huh?',
            birth_date: Date.new(1997, 2, 2))

User.create(email: 'john@example.com',
            password: '123456',
            full_name: 'John Doe',
            bio: 'Hello and nice to meet you',
            birth_date: Date.new(1990, 3, 3))

