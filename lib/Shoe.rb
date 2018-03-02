#!/usr/bin/env ruby
class Shoe < ActiveRecord::Base
  has_and_belongs_to_many :stores
  belongs_to :brand
end
