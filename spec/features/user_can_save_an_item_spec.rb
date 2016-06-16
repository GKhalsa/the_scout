require "rails_helper"

RSpec.describe "user can save an item" do
  it "they visit saved items and view their saved items" do
    item = create(:item)
    item2 = create(:item)
    user = create(:user)
    item_saved = create(:saved_item, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item2.name}")
    expect(page).to have_content("#{item.profit}")
    expect(page).to have_content("#{item2.profit}")

    within first(".saved") do
      click_button("Save")
    end

    visit "/saved"

    expect(page).to have_content("#{item_saved.name}")
  end
end
