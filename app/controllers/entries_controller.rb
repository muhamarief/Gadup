class EntriesController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :update, :destroy]

  def create
    @entry = Entry.new(entry_params)
    @entry.admin_id = params[:admin_id]
    @entry.feed_id = params[:feed_id]
    if @entry.save
      redirect_to feed_path(@entry.feed)
    else
      flash.now.alert = 'Something went wrong'
      redirect_to feed_path(@entry.feed)
    end
  end

  def public_news
    @entries = Entry.all.order('published DESC').limit(20)
    @entries_array = @entries[1..-1].each_slice(3).to_a
    render :index
  end

  def edit
    @entry = Entry.find(params[:id])
    render :admin_edit
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to feeds_path
    else
      render :edit_admin
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to feeds_path
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
