require 'spec_helper'

feature "User checks the messages" do

  before(:each) {
    Message.create(:text => "test message")
  }

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("test message")
  end

end
