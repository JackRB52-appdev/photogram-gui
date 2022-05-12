class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "user_templates/index.html.erb"})
  end

  def details
    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first

    render({ :template => "user_templates/details.html.erb"})
  end

  def new_user
    input_username = params.fetch("input_username")

    new_user = User.new

    new_user.username = input_username

    new_user.save
    redirect_to("/users/" + input_username.to_s)
  end

  def update_username
    new_name = params.fetch("input_username")
    user_id = params.fetch("path_id")
    
    the_user = User.where({:id => user_id}).first

    the_user.username = new_name

    the_user.save
    redirect_to("/users/" + new_name)
  end

end
