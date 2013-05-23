Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  match '/dibs-referral', to: 'orders#populate'
end

