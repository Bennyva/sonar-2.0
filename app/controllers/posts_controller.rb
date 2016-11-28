#the posts controller contains all of the code for any page inside of /pages
class PostsController < ApplicationController
    #for making a new post
    def new
        @post = Post.new
    end    
    
    #passing through post params
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        respond_to do |f|
            if(@post.save)#logic for if post is saved successfully and "redirect"
                f.html { redirect_to "", notice: "Post Created!" }
            else
                f.html { redirect_to "", notice: "Error: Post not saved!" }
            end    
        end
    end
   
   private
   def post_params #allows certain data to be passed via form (strong parameters, in ruby 4)
        params.require(:post).permit(:user_id, :content) #security feature to make sure that people aren't passing through data or updating parts of the model that we don't want them to update
   end
end    