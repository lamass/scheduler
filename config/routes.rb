Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :user_cohorts
  resources :cohorts, param: :slug do 
    resources :schedules, param: :slug
    post "cohorts/:slug/schedules/:slug/deploy", to: "schedules#deploy", as: "schedule/deploy"
    # post "/cohorts/:cohort_slug/schedules", to: "schedules#create", as: "/schedules"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root "cohorts#index"
end
