class EmbedlyService

  def initialize
    @api ||= embedly_api
  end

  def extract(url)
    response = embedly_api.extract(url: url).first

    {
      title: response.title,
      description: response.description,
      favicon_url: response.favicon_url,
      provider_name: response.provider_name,
      provider_url: response.provider_url,
      media_type: response.media.type,
      tag_list: tag_list(response),
      html: html(response),
      thumbnail_url: thumbnail_url(response)
    }
  end

  private

  def tag_list(response)
    response.keywords.sort do |keyword|
      keyword['score'].to_i
    end.map do |keyword|
      keyword['name']
    end.join(',')
  end

  def thumbnail_url(response)
    response.images.first['url'] if response.images.any?
  end

  def html(response)
    response.media.html if %w(video rich).include?(response.media.type)
  end

  def embedly_api
    @embedly_api ||= if Rails.application.secrets.embedly_api_key
      Embedly::API.new(key: Rails.application.secrets.embedly_api_key)
    else
      Embedly::API.new
    end
  end
end
