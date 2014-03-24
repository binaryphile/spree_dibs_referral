module Spree
  class Admin::DibsReferralsController < Admin::BaseController
    def index
      @referrals = Spree::Order.dibs_referrals
    end
  end
end
