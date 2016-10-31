require 'rails_helper'

describe "User is logged in as admin" do
  it "they can delete a category" do
    user = create(:user)
    catg = create(:category)
    page.set_rack_session(user: user.id)

    visit home_path
    click_link "All Categories"

    within(".catg_#{catg.id}") do
      click_on "Delete"
    end

    click_link "All Categories"

    expect(page).not_to have_content(catg.description)

  end
end
