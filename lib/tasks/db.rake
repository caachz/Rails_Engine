namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task reseed: ['db:schema:load'] do
  end
  puts 'resetting completed.'
end
