ENV['RACK_ENV'] = 'test'
require 'sinatra'
require 'sinatra/activerecord'
require 'rspec'
require 'pry'
require 'pg'
require 'Store'
require 'Brand'
require 'Inventory'

RSpec.configure do |config|
  config.after(:each) do
    Store.all().each() do |store|
      store.destroy()
    end
  end
    Brand.all().each() do |brand|
      brand.destroy()
    end
  end
    Shoes.all().each() do |shoe|
      shoe.destroy()
    end
  end
end
