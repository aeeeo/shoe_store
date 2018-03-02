require 'spec_helper'

describe('Store') do
  it("What you are testing") do
    store = Store.create({:name => "Nike Outlet"})
    binding.pry
    expect(store.name).to(eq("Nike Outlet"))
  end
end
