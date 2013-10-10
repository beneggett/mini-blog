class PostsController < ApplicationController
  # before_filter :authorize, only: [:new, :create, :update, :edit, :destroy] 
  before_filter :authorize, except: [:index, :show] 
  before_filter :verify_author_owns_post, only: [:edit, :update, :destroy]
  # GET /posts
  # GET /posts.json

  def index
    @posts = Post.where("published_at <= ?", Time.now).order("published_at desc")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.xml { render xml: @posts}
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_author.posts.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_author.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # GET /posts/1/edit
  def edit
    
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
  def verify_author_owns_post
    @post = Post.find(params[:id])
    redirect_to post_path(@post), alert: "You shall not pass" unless @post.author == current_author
  end

end
