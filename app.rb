require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('pry')
require('pg')
require('Store')
require('Brand')
require('Inventory')


get('/') do
  erb:index
end

post('/') do
  erb:index
end
