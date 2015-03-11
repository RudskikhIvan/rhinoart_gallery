Rhinogallery::Engine.routes.draw do

  scope "(:locale)", locale: /ru|en/ do

    resources :galleries do
      get 'load_images' => 'galleries#load_images', :on => :member
      get 'move_up' => 'galleries#move_up', :on => :member
      get 'move_down' => 'galleries#move_down', :on => :member
      resources :images
    end

  end

end
