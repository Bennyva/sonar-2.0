#the pages controller contains all of the code for any page inside of /pages
class PagesController < ApplicationController
  
  #back end code for pages/index
  def index
    
    
    
  end
  	#back end code for pages/home
  def home
    @posts = Post.all
    @newPost = Post.new
  end
#back end code for pages/profile
  def profile
    #grab the username from the url as :id
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      #redirect to 404 page not found
      redirect_to root_path, :notice=> "User not found!"
    end
    
    @posts = Post.all.where("user_id=?", User.find_by_username(params[:id]).id)
    @newPost = Post.new
  end
#back end code for pages/explore
  def explore
    @posts = Post.all
  end
  
  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end