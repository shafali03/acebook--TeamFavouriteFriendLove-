require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them in reverse chronological order" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    time_for_hello = DateTime.now.strftime("%C%y-%m-%d %H:%M:%S")
    sleep(5)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Goodbye, world!"
    click_button "Submit"
    time_for_goodbye = DateTime.now.strftime("%C%y-%m-%d %H:%M:%S")
    expect(page.text).to have_content("Goodbye, world! #{time_for_goodbye} Edit Hello, world! #{time_for_hello} Edit")
  end
end