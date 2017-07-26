class GadupTipsController < ApplicationController
  before_action :authenticate_admin!, except: :show

  layout 'admin', except: :show
  layout 'user', only: :show

  def new
    @gadup_tip = GadupTip.new
  end

  def index
    @gadup_tips = GadupTip.all
  end

  def create
    @gadup_tip = GadupTip.new(gadup_tips_params)
    if @gadup_tip.save
      @feed = Feed.find_by(url: 'http://gadup.co.id/')
      if @feed.nil?
        @feed = Feed.new(name: 'Gadup Tips', url: 'http://gadup.co.id/', description: 'Everything about finance', admin_id: 1)
        if @feed.save && create_entry
            redirect_to gadup_tips_path
        else
          render :new
        end
      else
        if create_entry
          redirect_to gadup_tips_path
        else
          render :new
        end
      end
    else
      render :new
    end
  end

  def show
    @gadup_tip = GadupTip.find(params[:id])
  end

  def edit
    @gadup_tip = GadupTip.find(params[:id])
  end

  def update
    @gadup_tip = GadupTip.find(params[:id])
    if @gadup_tip.update(gadup_tips_params) && update_entry
      redirect_to gadup_tips_path
    else
      render :edit
    end
  end

  def destroy
    @gadup_tip = GadupTip.find(params[:id])
    if @gadup_tip.destroy
      redirect_to gadup_tips_path
    else
      redirect_to admins_path
    end
  end

  private
  def gadup_tips_params
    params.require(:gadup_tip).permit(:title,
                                      :author,
                                      :content,
                                      :display_picture)
  end

  def create_entry
    @entry = Entry.new(feed_id: @feed.id, entries_url: "#{root_url}/tips/#{@gadup_tip.id}", title: @gadup_tip.title, content: @gadup_tip.content.first(200), author: @gadup_tip.author, image_url: @gadup_tip.display_picture, published: @gadup_tip.created_at, admin_id: 1, category: 2)
    if @entry.save
      @gadup_tip.entry_id = @entry.id
      @gadup_tip.save
      return true
    else
      return false
    end
  end

  def update_entry
    @entry = @gadup_tip.entry
    if @entry.update(title: @gadup_tip.title, content: @gadup_tip.content.first(200), author: @gadup_tip.author, image_url: @gadup_tip.display_picture)
      return true
    else
      return false
    end
  end
end
