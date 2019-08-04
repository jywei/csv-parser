Rails.application.routes.draw do

  resources :people do
    collection { post :import }
  end

  root 'welcome#show'
end
