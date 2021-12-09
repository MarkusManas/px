Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  devise_scope :user do
    get '', to: "devise/sessions#new"
    root to: "devise/sessions#new"
  end
  resources :users
  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
end
