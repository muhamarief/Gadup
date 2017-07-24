class GadupTipsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

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
        if @feed.save
          @entry = Entry.new(feed_id: @feed.id, entries_url: "http://gadup.co.id/gadup_tips/#{@gadup_tip.id}", title: @gadup_tip.title, content: @gadup_tip.content.first(200), author: @gadup_tip.author, published: @gadup_tip.created_at, admin_id: 1, category: 2)
          if @entry.save
            redirect_to gadup_tips_path
          else
            render :new
          end
        else
          render :new
        end
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def gadup_tips_params
    params.require(:gadup_tip).permit(:title,
                                      :author,
                                      :content,
                                      :display_picture)
  end
end
