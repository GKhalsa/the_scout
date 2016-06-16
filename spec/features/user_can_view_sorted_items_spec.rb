require "rails_helper"

RSpec.describe "user can view order of items by margin" do
  it "shows items ordered by margin" do
    item = create(:item)
    item2 = create(:item)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on("Margin")

    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item2.name}")
    expect(page).to have_content("#{item.profit}")
    expect(page).to have_content("#{item2.profit}")

    within first(".item-row") do
      expect(page).to have_content("#{item2.name}")
    end

    within all('.item-row').last do
      expect(page).to have_content("#{item.name}")
    end

  end
end

RSpec.describe "user can view order of items by margin" do
  it "shows items ordered by margin" do
    item = create(:item)
    item2 = create(:item)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on("Profit")

    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item2.name}")
    expect(page).to have_content("#{item.profit}")
    expect(page).to have_content("#{item2.profit}")

    within first(".item-row") do
      expect(page).to have_content("#{item2.name}")
    end

    within all('.item-row').last do
      expect(page).to have_content("#{item.name}")
    end

  end
end

RSpec.describe "user can view order of items by margin" do
  it "shows items ordered by margin" do
    item = create(:item)
    item2 = create(:item)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on("Salesrank")

    expect(page).to have_content("#{item.name}")
    expect(page).to have_content("#{item2.name}")
    expect(page).to have_content("#{item.profit}")
    expect(page).to have_content("#{item2.profit}")

    within first(".item-row") do
      expect(page).to have_content("#{item.name}")
    end

    within all('.item-row').last do
      expect(page).to have_content("#{item2.name}")
    end

  end
end
