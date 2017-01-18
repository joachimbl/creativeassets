module Frontend
  class LinksController < Frontend::BaseController
    def show
      find_link
    end

    def new
      @link = Link.new
    end

    def create
      link = ::LinkService.new.update_or_create(params[:link][:url], current_user)
      redirect_to root_path if link.persisted?
    end

    private

    def find_link
      @link = Link.find(params[:id])
    end
  end
end
