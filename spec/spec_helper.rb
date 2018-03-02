# ENV['RACK_ENV'] = 'test'
# require 'sinatra'
# require 'sinatra/activerecord'
# require 'rspec'
# require 'pry'
# require 'pg'
# require 'store'
# require 'brand'
# require 'shoe'
# require 'shoulda-matchers'
#
# RSpec.configure do |config|
#   config.after(:each) do
#     Store.all().each() do |store|
#       store.destroy()
#     end
#
#     Brand.all().each() do |brand|
#       brand.destroy()
#     end
#
#     Shoe.all().each() do |shoe|
#       shoe.destroy()
#     end
#   end
# end
