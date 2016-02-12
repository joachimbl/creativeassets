module Api
  class LinkSerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :description,
               :url,
               :favicon_url,
               :provider_name,
               :provider_url,
               :thumbnail_url,
               :path

    has_one :author

    def path
      link_path(object)
    end
  end
end
