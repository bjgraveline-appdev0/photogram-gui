class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => "asc"})
    render({ :template => "user_templates/index.html.erb"})
  end
  
  def show
    #Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.at(0)
    render({ :template => "user_templates/show.html.erb"})
  end
  
  def update
    input_username = params.fetch("query_username")
    input_user_id = params.fetch("user_id")

    matching_usernames = User.where({ :id => input_user_id })
    the_user = matching_usernames.at(0)

    the_user.username = input_username

    the_user.save

    #render({ :template => "photo_templates/update.html.erb" })
    redirect_to("/users/" + input_username.to_s)
  end

  def create
    input_username = params.fetch("query_username")

    a_new_user = User.new
    a_new_user.username = input_username

    a_new_user.save

    #render({ :template => "photo_templates/create.html.erb" })
    redirect_to("/users/" + input_username.to_s)
  end
end
