Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:username", { :controller => "users", :action => "details"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "details"})

  get("/delete_photo/:path_id", {:controller => "photos", :action => "remove"})
end
