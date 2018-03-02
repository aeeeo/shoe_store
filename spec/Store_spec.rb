require 'spec_helper'

describe('Store') do
  it("Saves a store") do
    store = Store.create({:name => "Nike Outlet"})
    expect(store.name).to(eq("Nike Outlet"))
  end
  describe(Store) do
    it { should have_and_belong_to_many(:brands) }
  end
  describe(Store) do
    it { should have_and_belong_to_many(:shoes) }
  end
  it("Saves a store, a brand, and a shoe") do
    store = Store.create({:name => "Nike Outlet"})
    brand = Brand.create({:name => "Nike"})
    store.brands.push(brand)
    shoe = Shoe.create({:name => "Roshe", :price => "75"})
    brand.shoes.push(shoe)
    shoe.stores.push(store)
    expect(store.shoes).to(eq([shoe]))
  end
end
