map.namespace :admin do |admin|
  admin.resources :polls do |poll|
    poll.resources :poll_options
  end

  admin.resources :poll_results
  #map.poll_results '/poll_results', :controller => :poll_results, :action => :index
  #map.poll_results '/poll_results/*id', :controller => :poll_results, :action => :show
end
