Rails.application.routes.draw do
  # Routes for the Time_table resource:
  # CREATE
  get "/time_tables/new", :controller => "time_tables", :action => "new"
  post "/create_time_table", :controller => "time_tables", :action => "create"

  # READ
  get "/time_tables", :controller => "time_tables", :action => "index"
  get "/time_tables/:id", :controller => "time_tables", :action => "show"

  # UPDATE
  get "/time_tables/:id/edit", :controller => "time_tables", :action => "edit"
  post "/update_time_table/:id", :controller => "time_tables", :action => "update"

  # DELETE
  get "/delete_time_table/:id", :controller => "time_tables", :action => "destroy"
  #------------------------------

  # Routes for the Stop_datum resource:
  # CREATE
  get "/stop_data/new", :controller => "stop_data", :action => "new"
  post "/create_stop_datum", :controller => "stop_data", :action => "create"

  # READ
  get "/stop_data", :controller => "stop_data", :action => "index"
  get "/stop_data/:id", :controller => "stop_data", :action => "show"

  # UPDATE
  get "/stop_data/:id/edit", :controller => "stop_data", :action => "edit"
  post "/update_stop_datum/:id", :controller => "stop_data", :action => "update"

  # DELETE
  get "/delete_stop_datum/:id", :controller => "stop_data", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
