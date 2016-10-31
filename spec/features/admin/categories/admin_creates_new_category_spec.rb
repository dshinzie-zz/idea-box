require 'rails_helper'

describe "User is logged in as admin" do
  it "they can create a new category" do
    user = create(:user)
    page.set_rack_session(user: user.id)

    visit home_path
    click_link "New Category"

    fill_in "category[name]", with: "This Category"
    fill_in "category[description]", with: "Stuff"

    click_on "Create Category"
    click_link "All Categories"

    expect(page).to have_content("This Category")
  end
end
