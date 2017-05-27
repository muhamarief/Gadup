class Api::V1::FeedsController < Api::V1::BaseController
  before_action :authenticate_admin!, only: [:create, :update, :destroy]

  def create
    @feed = Feed.new(feed_params)
    @feed.admin_id = current_authenticatee.id
    if @feed.save
      redirect_to v1_feeds_path
    else
      flash.now.alert = 'Something went wrong'
      redirect_to v1_feeds_path
    end
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
  end

  def destroy
  end

  private
  def feed_params
    params.require(:feed).permit(:name, :url, :description)
  end

end
