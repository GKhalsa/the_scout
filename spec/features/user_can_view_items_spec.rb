require "rails_helper"

RSpec.describe "user can view items on home page" do
  it "shows a list of items" do
    item = create(:item)
    item2 = create(:item)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item2.name}")
    expect(page).to have_content("#{item.profit}")
    expect(page).to have_content("#{item2.profit}")
  end
end
