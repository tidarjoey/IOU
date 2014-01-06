Iou::Application.routes.draw do
  root :to => 'bills#new'

  resources :bills
  match '/bills/:id/billconfirmation' => 'bills#billconfirmation', :via => :post, :as => :billconfirmation

	resources :debts, :only => [:create, :new, :show]
  match '/debts/:id/paymentconfirmation' => 'debts#paymentconfirmation', :via => :post, :as => :paymentconfirmation

  resources :session, :only => [:create, :destroy, :new]

  resources :users, :except => [:destroy, :index]
  match '/:id' => 'users#show', :as => :user
end