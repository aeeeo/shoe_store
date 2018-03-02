require 'spec_helper'

describe('Store') do
  it("Saves a store") do
    store = Store.create({:name => "Nike Outlet"})
    expect(store.name).to(eq("Nike Outlet"))
  end

end
