require 'spec_helper'

describe('Shoe') do
  it("Saves a shoe price correctly") do
    shoe = Shoe.create({:name => "roshe", :price => "125"})
    expect(shoe.price).to(eq("$125.00"))
  end
  describe(Shoe) do
    it { should belong_to(:brand) }
  end
  describe(Shoe) do
    it { should have_and_belong_to_many(:stores) }
  end
end
