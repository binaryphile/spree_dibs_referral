Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  get '/dibs-referral', to: 'orders#populate'
  namespace :admin do
    resources :dibs_referrals
  end
end

