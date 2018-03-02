#!/usr/bin/env ruby
class Brand < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  before_save(:format_name)

  has_and_belongs_to_many :stores
  has_many :shoes

  private

  def format_name
    self.name=(name.chomp.downcase.capitalize)
  end
end
