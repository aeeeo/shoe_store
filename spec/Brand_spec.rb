require 'spec_helper'

describe('Brand') do
  it("Saves a brand") do
    brand = Brand.create({:name => "Nike"})
    expect(brand.name).to(eq("Nike"))
  end

end
