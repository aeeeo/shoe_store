#!/usr/bin/env ruby
class Shoe < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 25}})
  before_save(:format_name)

  has_and_belongs_to_many :stores
  belongs_to :brand

  private

  def format_name
    self.name=(name.chomp.downcase.capitalize)
  end
end
