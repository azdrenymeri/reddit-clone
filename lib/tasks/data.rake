namespace :data do
  desc 'Drops the database,recreate it, runs migrations and seeds.rb'
 
  task re_create: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    system('rake db:seed')
  end

end
