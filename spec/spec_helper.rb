ENV['RACK_ENV'] = 'test'
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
    Inventory.all().each() do |inventory|
      inventory.destroy()
    end
  end
end
