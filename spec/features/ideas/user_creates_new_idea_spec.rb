require 'rails_helper'

describe "User visits home page" do
  it "they can create a new idea" do
    user = create(:user)
    page.set_rack_session(user: user.id)

    visit home_path
    click_link "New Idea"

    fill_in "idea[name]", with: "This Idea"
    fill_in "idea[description]", with: "Finish Project"

    click_on "Create Idea"
    expect(page).to have_content("This Idea")
    expect(page).to have_content("Finish Project")
  end
end
