# frozen_string_literal: true

RSpec.describe "Home", :web do
  it "renders home page" do
    visit "/"
    expect(page).to have_content("Hemo")
  end
end
