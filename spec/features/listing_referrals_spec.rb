require "spec_helper"

describe "Referral Listing" do
  stub_authorization!

  before(:each) do
    unless example.metadata[:no_referrals]
      create(:referral_order, created_at: 1.day.from_now, completed_at: 1.day.from_now, number: "R100")
      create(:referral_order, created_at: 1.day.from_now, completed_at: 1.day.from_now, number: "R101")
    end
    create(:order, created_at: 1.day.from_now, completed_at: 1.day.from_now, number: "R102")
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
      expect(page).to have_no_content("R102")
    end

    it "should have column names" do
      expect(page).to have_content("Number")
      expect(page).to have_content("State")
      expect(page).to have_content("Referral")
      expect(page).to have_content("Commission")
    end
  end
end
