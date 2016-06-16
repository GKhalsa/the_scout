require "rails_helper"

RSpec.describe "user can get csv" do
  it "it stores a csv locally" do
    item = create(:item)
    item2 = create(:item)
    user = create(:user)
    item_saved = create(:saved_item, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/saved"

    click_on("Export to CSV")
  end
end
