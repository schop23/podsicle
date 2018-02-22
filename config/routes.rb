Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get    '/posts'           => 'posts#index'
  get    '/posts/new'       => 'posts#new', as: "new_post"
  get    '/posts/:id'       => 'posts#show', as: "post"
  post   '/posts'           => 'posts#create'
  get    '/posts/:id/edit'  => 'posts#edit', as: "edit_post"
  put    '/posts/:id'       => 'posts#update'
  delete '/posts/:id'       => 'posts#destroy'

  get    '/comments'           => 'comments#index'
  get    '/comments/new'       => 'comments#new', as: "new_comment"
  get    '/comments/:id'       => 'comments#show', as: "comment"
  post   '/comments'           => 'comments#create'
  get    '/comments/:id/edit'  => 'comments#edit', as: "edit_comment"
  put    '/comments/:id'       => 'comments#update'
  delete '/comments/:id'       => 'comments#destroy'
end
