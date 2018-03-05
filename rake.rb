role = Role.new
role.name = "admin"
role.save

role = Role.new
role.name = "employee"
role.save

u = User.new
u.email = "admin@gmail.com" 
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
customer_names.each_with_index do |customer_name|
	c = Customer.new
	c.name = customer_name
	c.number = rand(10**10).to_s
	c.location = locations[index]
end

sizes = [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10]
15.times do
	product = Product.new
	product.size = sizes.sample
	product.category_id = Category.all.pluck(:id).sample
	product.save
end

30.times do 
	s = Sauda.new
	s.date = Date.today
	s.customer_id = Customer.all.pluck(:id).sample
	s.save
end
