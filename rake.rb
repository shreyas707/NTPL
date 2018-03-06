role = Role.new
role.name = "admin"
role.save

role = Role.new
role.name = "employee"
role.save

u = User.new
u.email = "admin@gmail.com"
u.number = rand(10**10).to_s
u.password = "password"
u.password_confirmation = "password"
u.role_id = Role.find_by(name: "admin").id
u.save

i = 1
2.times do
	u = User.new
	u.email = "emp" + i.to_s + "@gmail.com"
	u.password = "password"
	u.password_confirmation = "password"
	u.role_id = Role.find_by(name: "employee").id
	u.number = rand(10**10).to_s
	u.save
	i += 1
end

categories = ["Nail", "Topi Kanti", "Screwdriver", "Hammer", "Driller"]
categories.each do |category|
	c = Category.new
	c.name = category
	c.save
end

locations = ["Bangalore", "Mumbai", "Chennai", "Kolkata", "Hyderabad"]
customer_names = ["Rajiv", "Shreyas", "Anirudh", "Mahidhar", "Mahesh"]
customer_names.each_with_index do |customer_name, index|
	c = Customer.new
	c.name = customer_name
	c.number = rand(10**10).to_s
	c.location = locations[index]
	c.save
end

all_sizes = [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10]
i = 1
5.times do
	sizes = all_sizes.sample(3).sort
	j = 0
	3.times do
		product = Product.new
		product.size = sizes[j]
		product.category_id = Category.find(i).id
		product.save
		j += 1
	end
	i += 1
end

6.times do
	j = 0
	customers = Customer.all.pluck(:id)
	5.times do
		s = Sauda.new
		if Sauda.exists?
			sauda = Sauda.order(:id).last
			s.number = "NTPL - #{sauda.id + 1}"
		else
			s.number = "NTPL - 1"
		end
		s.date = Date.today
		s.customer_id = customers[j]
		s.is_order_taken = false
		s.is_delivered = false
		s.save!
		j += 1
	end
end

i = 1
numbers = [100, 200, 300, 400, 500]
quantities = [10, 20, 30, 40, 50]
30.times do
	j = 0
	categories = Category.all.pluck(:id).sample(2)
	2.times do
		slt = SaudaLineItem.new
		slt.category_id = categories[j]
		slt.rate = numbers.sample
		slt.quantity = quantities.sample
		slt.sauda_id = i
		slt.save!
		j += 1
	end
	i += 1
end

saudas = Sauda.all.limit(20)
saudas.each do |sauda|
	o = Order.create(sauda_id: sauda.id)
	sauda.sauda_line_items.each_with_index do |sli, index|
		OrderProduct.create(order_id: o.id, product_id: sli.category.products[index].id, order_quantity: sli.quantity, price: (sli.quantity * sli.rate))
	end
	sauda.is_order_taken = true
	sauda.save
end

saudas = Sauda.all.limit(10)
saudas.each do |sauda|
	d = Delivery.create(sauda_id: sauda.id)
	sauda.sauda_line_items.each_with_index do |sli, index|
		DeliveryProduct.create(delivery_id: d.id, product_id: sli.category.products[index].id, delivery_quantity: sli.quantity, price: (sli.quantity * sli.rate))
	end
	sauda.is_delivered = true
	sauda.save!
end



