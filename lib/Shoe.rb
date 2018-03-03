#!/usr/bin/env ruby
class Shoe < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 25}})
  validates(:price, {:presence => true, :length => {:maximum => 7}})
  before_save(:format_name, :format_price)

  has_and_belongs_to_many :stores
  belongs_to :brand

  private

  def format_name
    self.name=(name.chomp.downcase.titleize)
  end
  def format_price
    if self.price = nil
      self.price="$50.00"
    else
    self.price="$" + sprintf('%.2f', price.to_f).to_s
  end
  end
end
