class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
 
  # So admin abilities are applied to only these.  
  # So public can view product without signing in.
   load_and_authorize_resource :only => [:new, :update, :create, :destroy]
    
  # GET /products
  # GET /products.json
  def index
    if params[:q]
        search_term = params[:q]
        @products = Product.where("name LIKE ?", "%#{search_term}%")
    else
        @products = Product.all
    end
    
    

  end

  # GET /products/1
  # GET /products/1.json
  def show
      @comments = @product.comments.order("created_at DESC")
      @comments = Comment.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
  end

  # GET /products/new
  def new
    @product = Product.new
    @comment = @product.comments.new(comment_params)
        @comment.user = current_user
        
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product = Product.find(params[:product_id])
      @comment = @product.comments.new(comment_params)
      @comment.user = current.user
      
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully'}
        format.json { render :show, status: created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully'}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end
 
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
     @comment = Comment.find(params[:id])
        product  = @comment.product
        @comment.destroy
      redirect_to product
  end
   
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color)
    end
    
    
    
end
