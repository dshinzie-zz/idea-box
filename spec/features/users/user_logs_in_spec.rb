require 'rails_helper'

describe "User visits login page" do
  it "they can log in" do
    user = User.create(name: "Daniel", email: "daniel@daniel.com", password: "pass")

    visit home_path
    click_link "Login"

    within(".login") do
      fill_in "email", with: "daniel@daniel.com"
      fill_in "password", with: "pass"
      click_on "Login"
    end

    expect(current_path).to eq(home_path)
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Hello, Daniel")
  end


  it "they can log out" do
    user = User.create(name: "Daniel", email: "daniel@daniel.com", password: "pass")

    visit home_path
    click_link "Login"

    within(".login") do
      fill_in "email", with: "daniel@daniel.com"
      fill_in "password", with: "pass"
      click_on "Login"
    end
    
    click_link "Logout"

    expect(page).to have_content("Successfully logged out!")
  end
end
