require "rails_helper"

RSpec.describe "user can view order of items by margin" do
  it "shows items ordered by margin" do
    60.times do |n|
      create(:item)
    end

    item = Item.first
    item_last = Item.last
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    expect(page).to have_content("#{item_last.name}")

    visit "/margin?page=2"

    expect(page).to have_content("#{item.name}")
    expect(page).not_to have_content("#{item_last.name}")
  end
end
