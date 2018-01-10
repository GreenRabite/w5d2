class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]

    @post.sub_ids = params[:post][:sub_ids] #array of sub.id's => params[#array :sub_id]

    # @post_sub = PostSubs.new(params[:sub_id])

    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    @post.sub_ids = params[:post][:sub_ids]
    
    if @post
      if @post.update(post_params)
        redirect_to sub_post_url(@post.sub_id)
      else
        flash[:errors] = @post.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ["Can't find post"]
      render :edit
    end

  end



  def destroy
    @post = Post.find_by(id: params[:id])
    if @post && @post.destroy
      redirect_to subs_url
    else
      flash[:errors] = ["Post not found"]
      redirect_to subs_url
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:url,:content)
  end
end
