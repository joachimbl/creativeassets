module Frontend
  class LinksController < Frontend::BaseController
    def show
      find_link
    end

    private

    def find_link
      @link = Link.find(params[:id])
    end
  end
end
