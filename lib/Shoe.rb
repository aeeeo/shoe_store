#!/usr/bin/env ruby
class Shoe < ActiveRecord::Base
  before_validation(:format_name)
  validates(:name, {uniqueness: true, :presence => true, :length => {:maximum => 100}})
  before_save(:format_price)
  has_and_belongs_to_many :stores
  belongs_to :brand


  def pricify
    self.price="$" + sprintf('%.2f', price.to_f).to_s
  end

  private

  def format_name
    self.name=(name.chomp.downcase.titleize)
  end

  def format_price
      self.price=price.to_i
  end

end
