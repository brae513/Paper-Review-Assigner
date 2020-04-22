Rails.application.routes.draw do
    get 'students/index'
    get 'students/new'
    get 'students/show'
    get 'students/preference'
    get 'papers/index'
    get 'papers/new'

    devise_for :users

    
    get 'welcome/index', to: "welcome#index", as: "index"
    get 'welcome/professor', to: "welcome#professor", as: "professor"
    root 'welcome#index'

    resources :students
    resources :papers
    resources :eforms
end
