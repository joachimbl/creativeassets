module Api
  class LinkSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :url, :favicon_url, :provider_name, :provider_url, :thumbnail_url

    has_one :author
  end
end
