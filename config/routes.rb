Rails.application.routes.draw do

    devise_for :users

    
    get 'welcome/index', to: "welcome#index", as: "index"
    get 'welcome/professor', to: "welcome#professor", as: "professor"
    post 'welcome/professor', to: "welcome#performAssignment"
    get 'welcome/email_forms', to: "welcome#email_forms", as: "email_forms"
    get 'welcome/send_assignments', to: "welcome#send_assignments", as: "assignments"
    get "eforms/submission_verification", to: "eforms#submission_verification", as: "submission_verification"
    root 'welcome#index'

    resources :students
    resources :papers
    resources :eforms
end
