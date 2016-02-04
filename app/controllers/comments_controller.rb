class CommentsController < ApplicationController
   
    # So admin abilities are applied to only these.  
    # So public can view product without signing in.
    load_and_authorize_resource :only => [:new, :update, :create, :destroy]
    
    def index
        
    end

    def create
        @product = Product.find(params[:product_id])
        @comment = @product.comments.new(comment_params)
        @comment.user = current_user
        
        respond_to do |format|
            if @comment.save
                format.html { redirect_to @product, notice: 'Review was created successfully'}
                format.json {render :show, status: :created, location: @product}
            else
                format.html { redirect_to @product, alert: 'Review could not be saved'}
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
        
    end
    
    def destroy
#        @comment = Comment.find(params[:id])
#        product  = @comment.product
#        @comment.destroy
#        redirect_to product_path
    end
    
    def show
    end

private
    
    def comment_params
        params.require(:comment).permit(:user_id, :body, :rating)
    end


end

