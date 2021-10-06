class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :login_check
  before_action :user_check, only: %i[ show edit update destroy ]
  before_action :create_check, only: %i[ create ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.user_id = params[:user_id]
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." } 
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, user_id: @post.user_id, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @user = @post.user
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:msg, :datepost, :user_id)
    end

    def login_check
      if !session[:user_id]
        redirect_to main_path, alert: "Please login."
      end
    end

    def user_check
      if session[:user_id] != @post.user_id 
        redirect_to main_path, alert: "Wrong User. Please try again"
      end
    end

    def create_check 
      if session[:user_id] != Integer(post_params[:user_id])
        redirect_to main_path, alert: "Wrong User. Please try again"
      end
    end
end
