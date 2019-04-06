Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/admin/graph_ql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root 'pages#index'
  get 'index' => 'pages#index'
  get 'residential' => 'pages#residential'
  get 'corporate' => 'pages#corporate'
  get 'quote' => 'quotes#new'
  get 'thanks' => 'pages#thanks'
  get 'thanksleads' => 'pages#thanksleads'
  get 'career' => 'careers#new'
  get 'subscription' => 'subscriptions#new'
  get 'thanksquote' => 'pages#thanksquote'
  get 'thankssubs' => 'pages#thankssubs'
  get 'watson' => 'watson#watson'

  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'

  resources :quotes
  resources :careers
  resources :subscriptions
  resources :leads
end
