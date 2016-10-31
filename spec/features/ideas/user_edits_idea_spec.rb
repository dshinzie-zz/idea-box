require 'rails_helper'

describe "User visits home page" do
  it "they can edit an existing idea" do
    user = create(:user_with_idea)
    idea = user.ideas.first
    page.set_rack_session(user: user.id)

    visit home_path
    click_link idea.name

    within("#edit_idea_#{idea.id}") do
      fill_in "idea[name]", with: "Another Idea"
      click_on "Update"
    end

    expect(page).to have_content("Another Idea")
  end
end
