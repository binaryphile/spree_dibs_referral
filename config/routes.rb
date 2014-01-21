Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  get '/dibs-referral', to: 'orders#populate'
end

