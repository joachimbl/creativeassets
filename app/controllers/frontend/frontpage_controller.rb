module Frontend
  class FrontpageController < Frontend::BaseController
    def show
      @links_as_json = serialize_links(Link.limit(30))
    end

    private

    def serialize_links(links)
      ActiveModel::ArraySerializer.new(links, each_serializer: Api::LinkSerializer).as_json
    end
  end
end
