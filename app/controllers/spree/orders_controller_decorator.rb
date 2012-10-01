Spree::OrdersController.class_eval do
  after_filter :dibs_capture_referral, only: :edit

  private
    def dibs_capture_referral
      if session[:dibs_referral] and (!@current_order.dibs_referral or session[:dibs_referral] != @current_order.dibs_referral.email)
        @current_order.dibs_referral = Spree::User.find_by_email(session[:dibs_referral])
        @current_order.save
      end
    end
end
