class FeedsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :update, :destroy]
  layout :resolve_layout

  def create
    @feed = Feed.new(feed_params)
    @feed.admin_id = current_authenticatee.id
    if @feed.save
      redirect_to feeds_path
    else
      flash.now.alert = 'Something went wrong'
      redirect_to feeds_path
    end
  end

  def edit
    @feed = Feed.find(params[:id])
    render :admin_edit
  end


  def index
    @feeds = Feed.all
    if current_authenticatee.kind_of?(User)
      render "user_feeds"
    elsif current_authenticatee.kind_of?(Admin)
      @feed = Feed.new
      render "admin_feeds_index"
    end
  end

  def show
    @feed = Feed.find(params[:id])
    @entries_array = @feed.entries.each_slice(3).to_a
    @entry = Entry.new
    render "admin_feeds_show"
  end

  def update
    @feed = Feed.find(params[:id])
    if @feed.update(feed_params)
      redirect_to feeds_path
    else
      render :admin_edit
    end
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to feeds_path
  end

  private
  def feed_params
    params.require(:feed).permit(:name, :url, :description)
  end

  def resolve_layout
    case action_name
    when "index", "show"
      if current_authenticatee.kind_of?(Admin)
        "admin"
      else
        "application"
      end
    end
  end

end
