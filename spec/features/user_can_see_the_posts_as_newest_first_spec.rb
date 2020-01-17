RSpec.feature "Timeline", type: :feature do
  scenario "User can submit posts and view them in reverse chronological order" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    time_for_hello = DateTime.now.strftime("%d %b %C%y %H:%M:%S")
    sleep(5)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Goodbye, world!"
    click_button "Submit"
    time_for_goodbye = DateTime.now.strftime("%d %b %C%y %H:%M:%S")
    expect(page.text).to have_content("Goodbye, world! #{time_for_goodbye} Edit Delete Hello, world! #{time_for_hello}")
  end
end
