Rails.application.routes.draw do
  devise_for :users

  #Key: Y = 'View Made' Tally (Per #Category), X = 'View Not Made'

  # YY Homepage (Information Popup Embedded)
  get "/", to: "pages#home", as: "root"
  get "/pages/home", to: "pages#home", as: "home"
  
  # Y User Profile (To Do: Ensure new users can't have existing usernames)
  get "/users/:user_id/show", to: "users#show", as: "user"

  # Y Groups Index & Search (With Query Params)
  get "/groups", to: "groups#index", as: "groups"

  # Y Current Group
  get "/groups/:group_id/show", to: "groups#show", as: "group"

  # X Current Group Forum
  get "/groups/:group_id/threads/index", to: "threads#index", as: "threads"

  # X Individual Thread
  get "/groups/:group_id/threads/:thread_id/posts/index", to: "posts#index", as: "posts"

  # XX New Thread
  get "/groups/:group_id/threads/new", to: "threads#new", as: "new_thread"
  post "/groups/:group_id/threads,", to: "threads#create"

  # XX New Post
  get "/groups/:group_id/threads/:thread_id/posts/new", to: "posts#new", as: "new_post"
  post "/groups/:group_id/threads/:thread_id/posts", to: "posts#create"

  # YY New Event
  get "groups/:group_id/events/new", to: "events#new", as: "new_event"
  post "groups/:group_id/events", to: "events#create", as: "create_event"

  # X Individual Event
  get "groups/:group_id/events/:date/show", to: "events#show", as: "event"

  # X Group Sprint Progression
  get "groups/:group_id/progressions/index", to: "progressions#index", as: "progressions"

  # XX Group Progression/Photo Upload
  get "groups/:group_id/progressions/new", to: "progressions#new", as: "new_progression"
  post "groups/:group_id/progressions", to: "progressions#create"
end
