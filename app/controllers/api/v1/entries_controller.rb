class Api::V1::EntriesController < Api::V1::BaseController
  before_action :authenticate_admin!, only: [:create, :update, :destroy]

  def create
    @entry = Entry.new(entry_params)
    @entry.admin_id = params[:admin_id]
    @entry.feed_id = params[:feed_id]
    if @entry.save
      redirect_to v1_feed_path(@entry.feed)
    else
      flash.now.alert = 'Something went wrong'
      redirect_to v1_feed_path(@entry.feed)
    end
  end

  def index
    @entries = Entry.all.order('published DESC').limit(20)
    @entries_array = @entries[1..-1].each_slice(3).to_a
  end

  def update
  end

  def destroy
  end


  private
  def entry_params
    params.require(:entry).permit(:entries_url,
                                  :image_url,
                                  :title,
                                  :content,
                                  :author,
                                  :published)
  end
end
