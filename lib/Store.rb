#!/usr/bin/env ruby
class Store < ActiveRecord::Base
  validates(:name,  {:presence => true, uniqueness: true, :length => {:maximum => 100}})
  before_save(:format_name)

  has_and_belongs_to_many :shoes
  has_and_belongs_to_many :brands

  private

  def format_name
    self.name=(name.downcase.titleize)
  end
end
