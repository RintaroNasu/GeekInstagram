class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      tweet = Tweet.find(params[:tweet_id])
      comment = tweet.comments.build(comment_params) #buildを使い、contentとtweet_idの二つを同時に代入
      comment.user_id = current_user.id
      if comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      end
    end
    def destroy
        comment = Comment.find(params[:id])
        comment.destroy!
        redirect_to action: :index
      end
  
    private
      def comment_params
        params.require(:comment).permit(:content, :tweet_id)
      end
end
