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
    if params[:id]
      @entries = Entry.where('id < ?', params[:id]).where('category = ?', 1).order('id DESC').limit(15)
      @entries = @entries.each_slice(3).to_a
    else
      @first_entry = Entry.where('category = ?', 1).last
      @entries = Entry.where('category = ?', 1).order('id DESC').limit(16)
      @entries = @entries[1..-1].each_slice(3).to_a
      @tips = Entry.where('category = ?', 2).order('id DESC').limit(3)
    end

    respond_to do |format|
      format.html
      format.js
    end

    render :index
  end

  def public_articles
    if params[:id]
      @entries = Entry.where('id < ?', params[:id]).where('category = ?', 2).order('id DESC').limit(15)
      @entries = @entries.each_slice(3).to_a
    else
      @first_entry = Entry.where('category = ?', 2).last
      @entries = Entry.where('category = ?', 2).order('id DESC').limit(16)
      @entries = @entries[1..-1].each_slice(3).to_a
    end

    respond_to do |format|
      format.html
      format.js
    end

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
                                  :published,
                                  :category
                                  )
  end
end
