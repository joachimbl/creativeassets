module Api
  class LinksController < Api::BaseController
    def index
      @links = Link.includes(:users, :author).page(page).per_page(per_page)
      render json: @links
    end

    private

    def page
      params[:page] || 1
    end

    def per_page
      params[:per_page] || 24
    end
  end
end
