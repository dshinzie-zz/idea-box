require 'rails_helper'

describe "User visits home page" do
  it "they can create a new idea" do
    user = create(:user)
    page.set_rack_session(user: user.id)

    visit root_path

    fill_in "idea[name]", with: "Idea"
    fill_in "idea[description]", with: "Finish Project"

    click_on "Create Idea"
    expect(page).to have_content("Idea")
    expect(page).to have_content("Finish Project")
  end
end
