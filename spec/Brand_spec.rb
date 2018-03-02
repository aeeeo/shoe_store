require 'spec_helper'

describe('Brand') do
  it("Saves a brand") do
    brand = Brand.create({:name => "Nike"})
    expect(brand.name).to(eq("Nike"))
  end
  describe(Brand) do
    it { should have_many(:shoes) }
  end
  describe(Brand) do
    it { should have_and_belong_to_many(:stores) }
  end
end
