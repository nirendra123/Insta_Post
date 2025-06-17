class Posts::DownvotesController < ApplicationController
    def create
    @post = Post.find(params[:post_id])
    @post.downvote_from current_user

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "post_#{@post.id}_container",
          partial: "posts/likes",
          locals: { post: @post }
        )
      end
      format.html { redirect_to posts_path }
    end
end
end
