require 'spec_helper'

describe 'Referral Listing' do
  stub_authorization!

  before(:each) do
    create(:order, created_at: 1.day.from_now, completed_at: 1.day.from_now, number: 'R100', dibs_referral: Spree::User.find_by({ email: "spree@example.com" }))
    visit spree.admin_path
  end

  context 'listing orders' do
    before(:each) do
      click_link 'Referrals'
    end

    it 'should list existing orders' do
      expect(page).to have_content('R100')
    end

  end
end
