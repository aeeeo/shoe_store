require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '', {:type => :feature} do
  it '' do
    visit '/'
    fill_in('', :with => '')
    click_button('')
    expect(page).to have_content('')
  end
end