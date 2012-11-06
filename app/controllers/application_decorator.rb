ApplicationController.class_eval do
  before_filter :dibs_session_referral, only: [:show, :edit, :index, :populate]

  private
    def dibs_session_referral
      if params[:dibs_referral]
        session[:dibs_referral] = URI::decode_www_form_component params[:dibs_referral] # See http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/29373
      end
    end
end
