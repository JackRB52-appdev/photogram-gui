Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:username", { :controller => "users", :action => "details"})
  get("/add_user", { :controller => "users", :action => "new_user"})
  get("/update_user/:path_id", { :controller => "users", :action => "update_username"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "details"})

  get("/delete_photo/:path_id", {:controller => "photos", :action => "remove"})
  get("/insert_photo_record", {:controller => "photos", :action => "add"})
  get("/update_photo/:modify_id", {:controller => "photos", :action => "update"})
  get("/insert_comment_record", {:controller => "photos", :action => "comment"})

end
