require 'csv'

desc "Import seed data"
task :import => [:environment] do

  file1 = "db/customers.csv"

  CSV.foreach(file1, :headers => true) do |row|
    Customer.create (
      id: row[0],
      first_name: row[1],
      last_name: row[2],
      created_at: ow[3],
      updated_at: row[4]
    )
  end
end
