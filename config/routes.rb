Rails.application.routes.draw do
  devise_for :users

  #Homepage + What is Otagai? (Popup)
  get "/", to: "pages#home", as: "root"
  get "/pages/home", to: "pages#home", as: "home"
  
  #User Profile (ensure new users can't have existing usernames)
  get "/users/:id/show", to: "users#show", as: "user"

  #Groups Index/Search
  get "/groups", to: "groups#index", as: "groups"
  post "/groups", to: "groups#search"

  #Current Group
  get "/groups/:id/show", to: "groups#show", as: "group"

  #Current Group Forum
  get "/groups/:id/threads/index", to: "threads#index", as: "threads"

  #Individual Thread
  get "/groups/:id/threads/:id/posts/index", to: "posts#index", as: "posts"

  #New Thread
  get "/groups/:id/threads/new", to: "threads#new", as: "new_thread"
  post "/groups/:id/threads,", to: "threads#create"

  #New Post
  get "/groups/:id/threads/:id/posts/new", to: "posts#new", as: "new_post"
  post "/groups/:id/threads/:id/posts", to: "posts#create"

  #New Event
  get "groups/:id/events/new", to: "events#new", as: "new_event"
  post "groups/:id/events", to: "events#create"

  #Individual Event
  get "groups/:id/events/:id/show", to: "events#show", as: "event"

  #Group Sprint Progression
  get "groups/:id/progressions/index", to: "progressions#index", as: "progressions"

  #Group Progression/Photo Upload
  get "groups/:id/progressions/new", to: "progressions#new", as: "new_progression"
  post "groups/:id/progressions", to: "progressions#create"
end
