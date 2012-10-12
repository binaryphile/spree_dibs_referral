Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  match '/cart/:id/token/:token', to: 'orders#edit'
end
