Rails.application.routes.draw do
<<<<<<< HEAD
=======
<<<<<<< HEAD
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
=======
>>>>>>> 29b15f0... Chapter 4: Rails-flavored Ruby
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home" 
    get "/help", to: "static_pages#help"
  end
<<<<<<< HEAD
=======
>>>>>>> 8c9e28d... Chapter 4: Rails-flavored Ruby
>>>>>>> 29b15f0... Chapter 4: Rails-flavored Ruby
end
