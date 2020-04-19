Rails.application.routes.draw do
    get 'eforms/index'
    get 'eforms/submission_verification'
    get 'students/index'
    get 'students/new'
    get 'students/show'
    get 'papers/index'
    get 'papers/new'

    devise_for :users

    
    get 'welcome/index', to: "welcome#index", as: "index"
    get 'welcome/professor', to: "welcome#professor", as: "professor"
    root 'welcome#index'

    resources :eforms
    resources :students
    resources :papers
end
