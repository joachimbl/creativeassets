class LinkService

  def update_or_create(url, user)
    params = EmbedlyService.new.extract(url)
    link = Link.where(url: url).first_or_create do |link|
      link.title = params[:title]
      link.description = params[:description]
      link.favicon_url = params[:favicon_url]
      link.provider_name = params[:provider_name]
      link.provider_url = params[:provider_url]
      link.media_type = params[:media_type]
      # link.tags << params[:tag_list]
      link.html = params[:html]
      link.thumbnail_url = params[:thumbnail_url]
      link.author = user
    end
  end
end
