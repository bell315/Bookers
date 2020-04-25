Rails.application.routes.draw do
  get 'top' => 'homes#top'
  resources :books
  patch '/books/:id/edit' => 'books#update', as: 'update_books'
  root :to => 'homes#top'
end
