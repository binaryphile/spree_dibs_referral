require "spec_helper"

describe "Referral Listing" do
  stub_authorization!

  before(:each) do
    unless example.metadata[:no_referrals]
      create(:referral_order, created_at: 2.days.from_now, completed_at: 2.days.from_now, state: "complete", number: "R100")
      create(:referral_order, created_at: 1.day.from_now, completed_at: 1.day.from_now, state: "complete", number: "R101")
    end
    create(:order, created_at: 1.day.from_now, completed_at: 1.day.from_now, state: "complete", number: "R102")
    create(:order, created_at: 1.day.from_now, completed_at: 1.day.from_now, number: "R103")
    visit spree.admin_path
  end

  context "listing orders" do
    before(:each) do
      click_link "Referrals"
    end

    it "should show no referrals if empty", no_referrals: true do
      expect(page).to have_content("No referrals")
    end

    it "should list existing orders" do
      expect(page).to have_content("R100")
      expect(page).to have_content("R101")
    end

    it "should not list non-referral orders" do
      expect(page).not_to have_content("R102")
    end

    it "should have column names" do
      expect(page).to have_content("Number")
      expect(page).to have_content("Referral")
      expect(page).to have_content("Date")
      expect(page).to have_content("Total")
    end

    it "should only list completed orders" do
      expect(page).not_to have_content("R103")
    end

    it "should have a search filter" do
      expect(page).to have_content("Search")
    end
  end
end
