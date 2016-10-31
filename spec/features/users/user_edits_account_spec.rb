require 'rails_helper'

describe "User edits own account page" do
  it "they can edit account" do
    user = create(:user)
    page.set_rack_session(user: user.id)

    visit home_path
    click_link "My Account"
    fill_in "user[name]", with: "Daniel"
    click_on "Update User"

    expect(page).to have_content("Account updated")
    expect(page).to have_content("Hello, Daniel")
  end

end
