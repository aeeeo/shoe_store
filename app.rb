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
  @stores = Store.all
  @shoes = Shoe.all
  erb:index
end

post('/') do
  store_name = params.fetch("store_name")
  Store.create({:name => store_name})
  @stores = Store.all
  @brands = Brand.all
  @shoes = Shoe.all
  erb:index
end

get('/stores') do
  @stores = Store.all
  erb:stores
end

get('/brands') do
  @brands = Brand.all
  erb:brands
end

get('/shoes') do
  @shoes = Shoe.all
  erb:shoes
end

patch('/stores/:id/edit') do
  store_name = params.fetch("store_name")
  location = params.fetch("location")
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes
  @store.update({:name => store_name, :location => location})
  @all_shoes = Shoe.all
  erb:store_editor
end

get('/stores/:id/edit') do
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands

  @all_shoes = Shoe.all
  @shoes = @store.shoes
  erb:store_editor
end


get('/stores/:id') do
  @store = Store.find(params[:id].to_i)
  @brands = @store.brands
  @shoes = @store.shoes
  erb:store
end

post('/stores/:id/add_brand') do
  @store = Store.find(params[:id].to_i)
  brand_name = params.fetch("brand_name")
  if Brand.where(name: brand_name).take != nil
    brand = Brand.where(name: brand_name).take
    @store.brands.push(brand)
  else
    @store.brands.push(Brand.create({:name => brand_name}))
  end
  @brands = @store.brands
  @shoes = @store.shoes
  erb:store_editor
end

get('/brands/:id/edit') do
  @brand = Brand.find(params[:id].to_i)
  @shoes = @brand.shoes
  erb:brand_editor
end

post('/brands/:id/edit') do
  # if brands already exists
  shoe_name = params.fetch("shoe_name")
  price = params.fetch("price")
  @brand = Brand.find(params[:id].to_i)
  @shoes = @brand.shoes
  if Shoe.where(name: shoe_name).first != nil
    shoe = Shoe.where(name: shoe_name).first
    @brand.shoes.push(shoe)
  else
    @brand.shoes.push(Shoe.create({:name => shoe_name, :price => price}))
  end
  erb:brand_editor
end

get('/brands/:id') do
  @brand = Brand.find(params[:id].to_i)
  @stores = @brand.stores
  @shoes = @brand.shoes
  erb:brand
end

get('/shoes/:id/stores') do
  erb:shoe
end

get('/shoes') do
  erb:shoes
end

post('/stores/:id/add_brand') do
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
