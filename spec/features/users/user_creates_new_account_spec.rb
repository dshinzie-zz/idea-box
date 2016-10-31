require 'rails_helper'

describe "User visits a new user page" do
  it "they can create a new user" do
    visit home_path
    click_on "Create Account"
    fill_in "user[name]", with: "Daniel"
    fill_in "user[email]", with: "daniel@daniel.com"
    fill_in "user[password]", with: "pass"
    fill_in "user[password_confirmation]", with: "pass"
    click_on "Create User"

    expect(current_path).to eq(home_path)
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Hello, Daniel")
  end

  it "they enter invalid data" do
    visit home_path
    click_on "Create Account"
    fill_in "user[name]", with: ""
    fill_in "user[email]", with: "daniel@daniel.com"
    fill_in "user[password]", with: "pass"
    fill_in "user[password_confirmation]", with: "pass"
    click_on "Create User"

    expect(page).to have_content("Information missing")
    expect(page).not_to have_content("Hello, Daniel")
  end
end
