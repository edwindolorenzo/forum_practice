module Dashboard
  class ForumsController < ApplicationController
    before_action :authenticate!, only: [:new]
      
      def index
          @q = Forum.ransack(params[:q])
          @pagy, @forums = pagy(@q.result)
          respond_to do |format|
            format.html
            format.json { render json: @forums}
          end
          # @forums = Forum.all
      end

      def new
          @forum = Forum.new
      end

      def show
          @forum = Forum.find(params[:id])
      end

      def create
          # render plain: params[:forum].merge(user:current_user).inspect
          @forum = Forum.new(forum_params)
          if @forum.save
              redirect_to root_path
          else
              render 'new'
          end
      end

      def destroy
          @forum = Forum.find(params[:id])
          @forum.destroy

          redirect_to home_path, notice: 'Forum Has been deleted'
      end

      private
      def forum_params
          params.require(:forum).permit(:title, :body).merge(user:current_user)
      end

  end
end