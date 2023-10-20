desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  Movie.delete_all
  Director.delete_all
  User.delete_all

  # Create sample directors
  5.times do
    Director.create(
      name: Faker::Name.name,
      bio: Faker::Lorem.paragraph,
      dob: Faker::Date.birthday(min_age: 25, max_age: 70),
    )
  end

  # Create sample movies
  10.times do
    Movie.create(
      title: Faker::Movie.title,
      description: Faker::Lorem.paragraph,
      image_url: Faker::Internet.url,
      released_on: Faker::Date.between(from: 10.years.ago, to: Date.today),
    )
  end


  people = Array.new(10) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    }
  end

  people << { first_name: "Alice", last_name: "Smith" }
  people << { first_name: "Bob", last_name: "Smith" }
  people << { first_name: "Carol", last_name: "Smith" }
  people << { first_name: "Doug", last_name: "Smith" }
  
  # Create sample users
  3.times do
    User.create(
      email: Faker::Internet.email,
      password: "password", # You can customize the password
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      
    )
  end

  puts "Sample data populated for directors, movies, and users."
end
