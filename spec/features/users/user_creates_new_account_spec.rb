require 'rails_helper'

describe "User visits a new user page" do
  it "they can create a new user" do
    visit new_user_path
    fill_in "user[name]", with: "Daniel"
    fill_in "user[email]", with: "daniel@daniel.com"
    fill_in "user[password]", with: "pass"
    fill_in "user[password_confirmation]", with: "pass"
    click_on "Create User"

    expect(current_path).to eq(home_path)
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome, Daniel!")
  end
end
