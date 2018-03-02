#!/usr/bin/env ruby
class Shoe < ActiveRecord::Base
  has_and_belongs_to_many :brands
  has_and_belongs_to_many :stores
end
