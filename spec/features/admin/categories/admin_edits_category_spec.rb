require 'rails_helper'

describe "User is logged in as admin" do
  it "they can edit a category" do
    user = create(:user)
    catg = create(:category)
    page.set_rack_session(user: user.id)

    visit home_path
    click_link "All Categories"

    within(".catg_#{catg.id}") do
      fill_in "category[name]", with: "Another Category"
      click_on "Update"
    end

    click_link "All Categories"

    expect(page).to have_content("Another Category")
  end
end
