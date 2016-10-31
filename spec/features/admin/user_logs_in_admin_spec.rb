require 'rails_helper'

describe "User visits login page" do
  it "they log in as admin" do
    user = create(:user)
    page.set_rack_session(user: user.id)

    visit home_path

    expect(page).to have_content("New Category")
    expect(page).to have_content("New Image")
    expect(page).to have_content("All Categories")
    expect(page).to have_content("All Images")
  end

  it "they log in as default" do
    user = user = User.create(name: "Daniel", email: "daniel@daniel.com", password: "pass", is_admin: false)
    page.set_rack_session(user: user.id)

    visit home_path

    expect(page).not_to have_content("New Category")
    expect(page).not_to have_content("New Image")
    expect(page).not_to have_content("All Categories")
    expect(page).not_to have_content("All Images")
  end

end
