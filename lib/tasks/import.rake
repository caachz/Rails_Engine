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

    if customer.length == 1
      customer.first.update_attributes(customer_hash)
    else
      Customer.create!(customer_hash)
    end
  end
  puts 'Customers seeded'
end

desc "Import merchants from csv file"
task :import => [:environment] do

  file = "db/merchants.csv"

  CSV.foreach(file, :headers => true) do |row|
    merchant_hash = row.to_hash
    merchant = Merchant.where(id: merchant_hash["id"])

    if merchant.length == 1
      merchant.first.update_attributes(merchant_hash)
    else
      Merchant.create!(merchant_hash)
    end
  end
  puts 'Merchants seeded'
end

desc "Import items from csv file"
task :import => [:environment] do

  file = "db/items.csv"

  CSV.foreach(file, :headers => true) do |row|
    item_hash = row.to_hash
    item = Item.where(id: item_hash["id"])

    if item.length == 1
      item.first.update_attributes(item_hash)
    else
      Item.create!(item_hash)
    end
  end
  puts 'Items seeded'
end

desc "Import invoices from csv file"
task :import => [:environment] do

  file = "db/invoices.csv"

  CSV.foreach(file, :headers => true) do |row|
    invoice_hash = row.to_hash
    invoice = Invoice.where(id: invoice_hash["id"])

    if invoice.length == 1
      invoice.first.update_attributes(invoice_hash)
    else
      Invoice.create!(invoice_hash)
    end
  end
  puts 'Invoices seeded'
end

desc "Import invoice_items from csv file"
task :import => [:environment] do

  file = "db/invoice_items.csv"
  CSV.foreach(file, :headers => true) do |row|
    invoice_item_hash = row.to_hash
    invoice_item_hash["unit_price"] = invoice_item_hash["unit_price"].to_f / 100
    invoice_item = InvoiceItem.where(id: invoice_item_hash["id"])

    if invoice_item.length == 1
      invoice_item.first.update_attributes(invoice_item_hash)
    else
      InvoiceItem.create!(invoice_item_hash)
    end
  end
  puts 'invoice_items seeded'
end

desc "Import transactions from csv file"
task :import => [:environment] do

  file = "db/transactions.csv"

  CSV.foreach(file, :headers => true) do |row|
    transaction_hash = row.to_hash
    transaction = Transaction.where(id: transaction_hash["id"])

    if transaction.length == 1
      transaction.first.update_attributes(transaction_hash)
    else
      Transaction.create!(transaction_hash)
    end
  end
  puts 'Transactions seeded'
end
