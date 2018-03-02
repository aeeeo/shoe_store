require 'spec_helper'

describe('Shoe') do
  it("Saves a shoe") do
    shoe = Shoe.create({:name => "Roshe"})
    expect(shoe.name).to(eq("Roshe"))
  end
  describe(Shoe) do
    it { should belong_to(:brand) }
  end
  describe(Shoe) do
    it { should have_and_belong_to_many(:stores) }
  end
end
