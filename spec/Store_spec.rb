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
end
