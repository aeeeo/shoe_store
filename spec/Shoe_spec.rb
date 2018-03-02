require 'spec_helper'

describe('Shoe') do
  it("Saves a shoe") do
    shoe = Shoe.create({:name => "Roshe"})
    expect(shoe.name).to(eq("Roshe"))
  end

end
