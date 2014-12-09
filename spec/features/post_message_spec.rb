require 'spec_helper'

feature "User posts a new message" do
  scenario "when browsing the homepage" do
    expect(Message.count).to eq(0)
    visit '/'
    create_message("test message")
    expect(Message.count).to eq(1)
    msg = Message.first
    expect(msg.text).to eq("test message")
  end

  def create_message(text)
    within('#new-message') do
      fill_in 'text', :with => text
      click_button 'Post'
    end
  end
end
