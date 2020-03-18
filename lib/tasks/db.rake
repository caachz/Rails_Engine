namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task reseed: ['db:drop', 'db:create', 'db:migrate'] do
    puts 'resetting completed.'
  end
end
