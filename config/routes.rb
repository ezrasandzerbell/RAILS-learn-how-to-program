Rails.application.routes.draw do
  resources :courses do
    resources :lessons
  end

  resources :lessons do
    resources :chapters
  end
end
