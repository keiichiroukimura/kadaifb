class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update,:destroy]
  before_action :ensure_correct_user,{only: [:edit, :update,:destroy,]}
  before_action :login_required,only: [:index]
  def index
    @feeds = Feed.all
  end
  def show; end
  def new
     @feed = Feed.new(feed_params)
  end
  def edit; end
  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
      respond_to do |format|
        if @feed.save
          format.html { redirect_to @feed, notice: '載せたよ〜！' }
          format.json { render :show, status: :created, location: @feed }
        else
          format.html { render :new }
          format.json { render json: @feed.errors, status: :unprocessable_entity }
        end
      end
  end
  def update
    @feed.user_id = current_user.id
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'edit〜！' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: '消したよ〜!' }
      format.json { head :no_content }
    end
  end
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end
  def confirm
    @feed = Feed.new(feed_params)
  end
  private
  def login_required
    redirect_to user unless @current_user
  end


  def ensure_correct_user
    if @feed.user_id != current_user.id
      redirect_to feeds_path , notice: '編集できません!'
    end
  end
  def set_feed
    @feed = Feed.find(params[:id])
  end
  def feed_params
    params.require(:feed).permit(:image, :image_cache,:content)
  end
end
