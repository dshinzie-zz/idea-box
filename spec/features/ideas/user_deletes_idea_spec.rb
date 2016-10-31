require 'rails_helper'

describe "User visits home page" do
  it "they can edit an existing idea" do
    user = create(:user_with_idea)
    idea = user.ideas.first
    page.set_rack_session(user: user.id)

    visit home_path
    click_link idea.name

    within("#idea_#{idea.id}") do
      click_on "Delete"
    end

    expect(page).to have_content("#{idea.name} was successfully deleted")

    within(".stylelist") do
      expect(page).not_to have_content(idea.name)
    end

  end
end
