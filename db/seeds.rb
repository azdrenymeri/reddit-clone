# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

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

@user3 = User.new(
    email: 'janed@gmail.com',
    password: '123456',
    full_name: 'Janed Doe',
    bio: 'Animal lover',
    birth_date: Date.new(1990, 12,12)
)

@user3.picture.attach(
    io: File.open('public/images/janed.jpg'),
    filename: 'john.jpg',
    content_type: 'image/jpeg'
)

@user3.save

# Generating random users
# trying to fix the file from flickr
# TODO try to generate random images
#       from a third-party image api
 17.times do
    @usr = User.new(
        email: Faker::Internet.email,
        password: '123456',
        full_name: Faker::Name.name,
        bio:Faker::Quote.famous_last_words,
        birth_date: Date.new(1980,1,1)
        )
    
    # url = Faker::LoremFlickr.image 
    # uriFile = URI.open(url)
    # fn = File.basename(URI.parse(url).path)
    
    # puts "url: #{url}"
    # puts "uri: #{uriFile.path}"
    # puts "path: #{fn}"

    @usr.picture.attach(
        io: File.open(Rails.root.join('public/images/man.png')),
        filename: 'man.png',
        content_type: 'image/png'
        )

    @usr.save
end


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

@books_subreddit = SubReddit.new(
    user: @user1,
    title: 'Books',
    description: 'Share your books, rate other books, everyting about reading'
)

@books_subreddit.background_picture.attach(
    io: File.open(Rails.root.join('public/images/books.jpg')),
    filename: 'books.jpg',
    content_type: 'image/jpeg'
    )

@books_subreddit.save()

@gaming_subreddit = SubReddit.new(
    user: @user2,
    title: 'Gaming',
    description: 'This is a gaming zone disscussions'
)

@gaming_subreddit.background_picture.attach(
    io: File.open(Rails.root.join('public/images/games.jpg')),
    filename:'games.jpg',
    content_type: 'image/jpeg'
)

@gaming_subreddit.save

@futorology_subreddit = SubReddit.new(
    user: @user2,
    title: 'Future(s) Studies',
    description: 'a subreddit devoted to the field of Future(s) Studies and speculation about the development of humanity, technology, and civilization.'
)

@futorology_subreddit.background_picture.attach(
    io: File.open(Rails.root.join('public/images/futorology.jpg')),
    filename:'futorology.jpg',
    content_type: 'image/jpeg'
)
@futorology_subreddit.save

@ask_science_subreddit = SubReddit.new(
    user: @user1,
    title: 'AskScience',
    description: 'Got Questions? Get Answers.'
)

@ask_science_subreddit.background_picture.attach(
    io: File.open(Rails.root.join('public/images/science.jpg')),
    filename: 'science.jpg',
    content_type: 'image/jpeg'
)

@ask_science_subreddit.save

@elif_subreddit = SubReddit.new(
    user: @user2,
    title: 'Explain it like I\'m five',
    description: 'Ask any questions and get a detailed anwer'
)

@elif_subreddit.background_picture.attach(
    io: File.open(Rails.root.join('public/images/elif.jpg')),
    filename: 'elif.jpg',
    content_type: 'image/jpeg'
)

@elif_subreddit.save

# Posts
Post.create(
    sub_reddit: @programming_subreddit,
    user: @user2,
    title: 'Tabs Vs Spaces',
    content: 'During your daily job, do you use tabs or spaces'
)

Post.create(
    sub_reddit: @programming_subreddit,
    user: @user1,
    title: 'Your favourite programming language',
    content: 'Tell me your favourite language and why you choose it'
)

Post.create(
    sub_reddit: @programming_subreddit,
    user: @user3,
    title: 'How to split a string in java',
    content: 'I have a name variable where the user is typing its name. I want to seperate first name from last name.'
)

Post.create(
    sub_reddit: @programming_subreddit,
    user: @user1,
    title: 'Java vs C#',
    content: 'Tell me which language is best and why ?'
)

Post.create(
    sub_reddit: @books_subreddit,
    user: @user1,
    title: 'Weekly reading report',
    content: 'Tell me what have you been reading this week'
)


# Creating data for the join feature of sub_reddits

# first user joined programming sub_reddit
#  and the  join request is pending

UserSubReddit.create(
    user: @user1,
    sub_reddit: @programming_subreddit,
    status: UserSubReddit.statuses[:accepted]
)

UserSubReddit.create(
    user: @user1,
    sub_reddit: @books_subreddit,
    status: UserSubReddit.statuses[:accepted]
)

UserSubReddit.create(
    user: @user1,
    sub_reddit: @gaming_subreddit,
    status: UserSubReddit.statuses[:pending]
)

puts 'Done...'