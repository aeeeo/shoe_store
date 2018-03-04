require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('pry')
require('pg')
require('./lib/store')
require('./lib/brand')
require('./lib/shoe')


get('/') do
  @brands = Brand.all
  @stores = Store.all.order(:name)
  @shoes = Shoe.all.order(:brand_name)
  erb:index
end

get('/order_price') do
  @brands = Brand.all
  @stores = Store.all.order(:name)
  @shoes = Shoe.all.order(:price)
  erb:index
end

get('/order_name') do
  @brands = Brand.all
  @stores = Store.all.order(:name)
  @shoes = Shoe.all.order(:name)
  erb:index
end

post('/stores') do
  store_name = params.fetch("store_name")
  Store.create({:name => store_name})
  @stores = Store.all
  erb:stores
end

get('/stores') do
  @stores = Store.all.order(:name)
  erb:stores
end

get('/stores/order_location') do
  @stores = Store.all.order(:location)
  erb:stores
end

get('/brands') do
  @brands = Brand.all.order(:name)
  erb:brands
end

post('/brands') do
  brand_name = params.fetch("brand_name")
  img_url = params.fetch("img_url")
  Brand.create({:name => brand_name, :img_url => img_url})
  @stores = Store.all
  @brands = Brand.all.order(:name)
  @shoes = Shoe.all
  erb:brands
end

patch('/stores/:id/edit') do
  @all_shoes = Shoe.all
  store_name = params.fetch("store_name")
  location = params.fetch("location")
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes
  @store.update({:name => store_name, :location => location})
  erb:store_editor
end

get('/stores/:id/edit') do
  @all_shoes = Shoe.all
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes.order(:name)
  erb:store_editor
end

get('/stores/:id/edit/order_price') do
  @all_shoes = Shoe.all
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes.order(:price)
  erb:store_editor
end

get('/stores/:id') do
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes.order(:brand_name)
  erb:store
end

get('/stores/:id/edit/order_brand') do
  @all_shoes = Shoe.all
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes.order(:brand_name)
  erb:store_editor
end

get('/stores/:id/order_price') do
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes.order(:price)
  erb:store
end

get('/stores/:id/order_name') do
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes.order(:name)
  erb:store
end

post('/stores/:id/add_shoe') do
  @store = Store.find(params[:id].to_i)
  shoe_name = params.fetch("shoe_name")
  shoe = Shoe.where(name: shoe_name).take
  brand = Brand.where(name: shoe.brand.name)
  @shoes = @store.shoes
  @brands = @store.brands
  if @brands.any? { |i| (brand).include?(i) } == false
    @store.brands.push(brand)
  end
  if @shoes.where(name: shoe_name) == []
    @store.shoes.push(shoe)
  end
  @brands = @store.brands
  @shoes = @store.shoes
  @all_shoes = Shoe.all
  erb:store_editor
end

get('/brands/:id/edit') do
  @brand = Brand.find(params[:id].to_i)
  @shoes = @brand.shoes.order(:name)
  @stores = @brand.stores
  erb:brand_editor
end

patch('/brands/:id/edit') do
  brand_name = params.fetch("brand_name")
  img_url = params.fetch("img_url")
  @brand = Brand.find(params[:id].to_i)
  @brand.update({:name => brand_name, :img_url => img_url})
  @shoes = @brand.shoes.order(:name)
  @stores = @brand.stores
  erb:brand_editor
end

post('/brands/:id/add_shoe') do
  shoe_name = params.fetch("shoe_name")
  price = params["shoe_price"]
  shoe = Shoe.where(name: shoe_name).take
  @brand = Brand.find(params[:id].to_i)
  @shoes = @brand.shoes
  if shoe == nil
    @shoes.push(Shoe.create({:name => shoe_name, :price => price, :brand_name => @brand.name}))
  end
  @brand = Brand.find(params[:id].to_i)
  @stores = @brand.stores
  @shoes = @brand.shoes
  erb:brand_editor
end

get('/brands/:id') do
  @brand = Brand.find(params[:id].to_i)
  @stores = @brand.stores.order(:name)
  @shoes = @brand.shoes.order(:name)
  erb:brand
end

get('/brands/:id/order_price') do
  @brand = Brand.find(params[:id].to_i)
  @stores = @brand.stores.order(:name)
  @shoes = @brand.shoes.order(:price)
  erb:brand_editor
end

get('/shoes') do
  @shoes = Shoe.all.order(:brand_id)
  @brands = Brand.all
  erb:shoes
end

get('/shoes/order_price') do
  @brands = Brand.all
  @shoes = Shoe.all.order(:price)
  erb:shoes
end

get('/shoes/order_name') do
  @brands = Brand.all
  @shoes = Shoe.all.order(:name)
  erb:shoes
end

get('/shoes/:id') do
  @shoe = Shoe.find(params[:id].to_i)
  @brands = Brand.all
  @stores = Store.all
  @shoes = Shoe.all
  erb:shoe
end

patch('/shoes/:id') do
  @shoe = Shoe.find(params[:id].to_i)
  shoe_name = params.fetch("shoe_name")
  price = params.fetch("price")
  @shoe.update({:name => shoe_name, :price => price})
  @brands = Brand.all
  @stores = Store.all
  @shoes = Shoe.all
  erb:shoe
end

delete('/brands/:id/delete_shoes/:shoe_id') do

  erb:store_edit
end

delete('/stores/:id/delete') do
  erb:index
end

delete('/stores/:id/delete_brand/:brand_id') do

  erb:store_edit
end

delete('/stores/:id/delete_shoes/:shoe_id') do

  erb:store_edit
end

delete('/brands/:id/delete_shoes/:shoe_id') do

  erb:store_edit
end
