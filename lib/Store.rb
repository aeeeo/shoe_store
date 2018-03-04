#!/usr/bin/env ruby
class Store < ActiveRecord::Base
  before_validation(:format_name)
  validates(:name,  {:presence => true, uniqueness: true, :length => {:maximum => 100}})
  before_save(:format_name)
  before_save(:format_zip)

  has_and_belongs_to_many :shoes
  has_and_belongs_to_many :brands

  private

  def format_name
    self.name=(name.downcase.titleize)
  end

  def format_zip
    self.location=location
  end
end
