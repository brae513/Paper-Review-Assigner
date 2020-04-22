Rails.application.routes.draw do

    devise_for :users

    
    get 'welcome/index', to: "welcome#index", as: "index"
    get 'welcome/professor', to: "welcome#professor", as: "professor"
    post 'welcome/professor', to: "welcome#performAssignment"
    root 'welcome#index'

    resources :students
    resources :papers
    resources :eforms
end
