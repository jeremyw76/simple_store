676.times do
  title = Faker::Commerce.product_name
  price = Faker::Commerce.price
  stock_quantiy = Faker::Number.digit

  p = Product.create(title: title, description: 'For catchinig flies.', price: price, stock_quantity: stock_quantiy)
end
