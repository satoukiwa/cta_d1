Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "stop_data#index"
  # Routes for the Cta_loc resource:
  # CREATE
  get "/cta_locs/new", :controller => "cta_locs", :action => "new"
  post "/create_cta_loc", :controller => "cta_locs", :action => "create"

  # READ
  get "/cta_locs", :controller => "cta_locs", :action => "index"
  get "/cta_locs/:id", :controller => "cta_locs", :action => "show"

  # UPDATE
  get "/cta_locs/:id/edit", :controller => "cta_locs", :action => "edit"
  post "/update_cta_loc/:id", :controller => "cta_locs", :action => "update"

  # DELETE
  get "/delete_cta_loc/:id", :controller => "cta_locs", :action => "destroy"
  #------------------------------

  # Routes for the Int_stat_len resource:
  # CREATE
  get "/int_stat_lens/new", :controller => "int_stat_lens", :action => "new"
  post "/create_int_stat_len", :controller => "int_stat_lens", :action => "create"

  # READ
  get "/int_stat_lens", :controller => "int_stat_lens", :action => "index"
  get "/int_stat_lens/:id", :controller => "int_stat_lens", :action => "show"

  # UPDATE
  get "/int_stat_lens/:id/edit", :controller => "int_stat_lens", :action => "edit"
  post "/update_int_stat_len/:id", :controller => "int_stat_lens", :action => "update"

  # DELETE
  get "/delete_int_stat_len/:id", :controller => "int_stat_lens", :action => "destroy"
  #------------------------------

  # Routes for the Train_status resource:
  # CREATE
  get "/train_statuses/new", :controller => "train_statuses", :action => "new"
  post "/create_train_status", :controller => "train_statuses", :action => "create"

  # READ
  get "/train_statuses", :controller => "train_statuses", :action => "index"
  get "/train_statuses/:id", :controller => "train_statuses", :action => "show"

  # UPDATE
  get "/train_statuses/:id/edit", :controller => "train_statuses", :action => "edit"
  post "/update_train_status/:id", :controller => "train_statuses", :action => "update"

  # DELETE
  get "/delete_train_status/:id", :controller => "train_statuses", :action => "destroy"
  #------------------------------

  # Routes for the Train_log resource:
  # CREATE
  get "/train_logs/new", :controller => "train_logs", :action => "new"
  post "/create_train_log", :controller => "train_logs", :action => "create"

  # READ
  get "/train_logs", :controller => "train_logs", :action => "index"
  get "/train_logs/:id", :controller => "train_logs", :action => "show"

  # UPDATE
  get "/train_logs/:id/edit", :controller => "train_logs", :action => "edit"
  post "/update_train_log/:id", :controller => "train_logs", :action => "update"

  # DELETE
  get "/delete_train_log/:id", :controller => "train_logs", :action => "destroy"
  #------------------------------

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
