Product.destroy_all
Category.destroy_all

csv_file = Rails.root + 'db/products.csv'

products = SmarterCSV.process(csv_file)

products.each do |product|
  category = Category.find_or_create_by(name: product[:category])

  new_product = category.products.build(title: product[:name], price: product[:price], description: product[:description], stock_quantity: product[:stock_quantity])
  unless new_product.save then
    new_product.errors.messages.each do |column, errors|
      errors.each do |error|
        puts "The #{column} property #{error}."
      end
    end
  end
end