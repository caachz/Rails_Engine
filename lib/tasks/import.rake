require 'csv'

desc "Clear tables"
task :import => [:environment] do
  Transaction.delete_all
  InvoiceItem.delete_all
  Invoice.delete_all
  Item.delete_all
  Merchant.delete_all
  Customer.delete_all
  puts 'DB Cleared'

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
end

desc "Import customer from csv file"
task :import => [:environment] do

  file = "db/customers.csv"

  CSV.foreach(file, :headers => true) do |row|
    customer_hash = row.to_hash
    customer = Customer.where(id: customer_hash["id"])

    Customer.create!(customer_hash)

  end
  next_value = (Customer.order(id: :desc).limit(1).pluck(:id)[0]) + 1
  ActiveRecord::Base.connection.execute("alter sequence customers_id_seq restart with #{next_value};")
  puts 'Customers seeded'
end

desc "Import merchants from csv file"
task :import => [:environment] do

  file = "db/merchants.csv"

  CSV.foreach(file, :headers => true) do |row|
    merchant_hash = row.to_hash

    Merchant.create!(merchant_hash)

  end
  next_value = (Merchant.order(id: :desc).limit(1).pluck(:id)[0]) + 1
  ActiveRecord::Base.connection.execute("alter sequence merchants_id_seq restart with #{next_value};")
  puts 'Merchants seeded'
end

desc "Import items from csv file"
task :import => [:environment] do

  file = "db/items.csv"

  CSV.foreach(file, :headers => true) do |row|
    item_hash = row.to_hash
    item_hash["unit_price"] = (item_hash["unit_price"].to_i * 0.01).round(2)

    Item.create!(item_hash)
  end
  next_value = (Item.order(id: :desc).limit(1).pluck(:id)[0]) + 1
  ActiveRecord::Base.connection.execute("alter sequence items_id_seq restart with #{next_value};")
  puts 'Items seeded'
end

desc "Import invoices from csv file"
task :import => [:environment] do

  file = "db/invoices.csv"

  CSV.foreach(file, :headers => true) do |row|
    invoice_hash = row.to_hash
    invoice = Invoice.where(id: invoice_hash["id"])

    Invoice.create!(invoice_hash)

  end
  next_value = (Invoice.order(id: :desc).limit(1).pluck(:id)[0]) + 1
  ActiveRecord::Base.connection.execute("alter sequence invoices_id_seq restart with #{next_value};")
  puts 'Invoices seeded'
end

desc "Import invoice_items from csv file"
task :import => [:environment] do

  file = "db/invoice_items.csv"
  CSV.foreach(file, :headers => true) do |row|
    invoice_item_hash = row.to_hash
    invoice_item_hash["unit_price"] = (invoice_item_hash["unit_price"].to_i * 0.01).round(2)
    InvoiceItem.create!(invoice_item_hash)
  end
  next_value = (InvoiceItem.order(id: :desc).limit(1).pluck(:id)[0]) + 1
  ActiveRecord::Base.connection.execute("alter sequence invoice_items_id_seq restart with #{next_value};")
  puts 'invoice_items seeded'
end

desc "Import transactions from csv file"
task :import => [:environment] do

  file = "db/transactions.csv"

  CSV.foreach(file, :headers => true) do |row|
    transaction_hash = row.to_hash
    if transaction_hash["result"] == "success"
      transaction_hash["result"] = 0
    else
      transaction_hash["result"] = 1
    end

    Transaction.create!(transaction_hash)
  end
  next_value = (Transaction.order(id: :desc).limit(1).pluck(:id)[0]) + 1
  ActiveRecord::Base.connection.execute("alter sequence transactions_id_seq restart with #{next_value};")
  puts 'Transactions seeded'
end
