# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Running database seed'

# Users
@user1 = User.new(email: 'azdreny@gmail.com',
            password: '123456',
            full_name: 'Azdren Ymeri',
            bio: 'This is Azdren huh?',
            birth_date: Date.new(1997, 2, 2))

@user1.picture.attach(
    io: File.open(Rails.root.join('public/images/puppy.jpg')),
    filename: 'puppy.jpg',
    content_type: 'image/jpeg'
)

@user1.save()


@user2 = User.new(email: 'john@example.com',
            password: '123456',
            full_name: 'John Doe',
            bio: 'Hello and nice to meet you',
            birth_date: Date.new(1980, 3, 3))

@user2.picture.attach(
    io: File.open(Rails.root.join('public/images/john.jpg')),
    filename: 'john.jpg',
    content_type: 'image/jpeg'
)

@user2.save()

# Subreddits
@programming_subreddit = SubReddit.new(
    user: @user1,
    title: 'Programming',
    description: 'Everything about programming news, tutorials, blogs and many more'
)

@programming_subreddit.background_picture.attach(
    io: File.open(Rails.root.join('public/images/programming.jpg')),
    filename:'programming.jpg',
    content_type: 'image/jpeg'
)

@programming_subreddit.save()

@movies_subreddit = SubReddit.new(
    user: @user2,
    title: 'Movies',
    description: 'Latests movies trailers posted here, No Spoilers !'
)

@movies_subreddit.background_picture.attach(
    io: File.open(Rails.root.join('public/images/movies.jpg')),
    filename: 'movies.jpg',
    content_type: 'image/jpeg'
)

@movies_subreddit.save()

puts 'Done...'