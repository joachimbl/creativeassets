module Api
  class LinksController < Api::BaseController
    def index
      @links = Link.includes(:users, :author).page(page).per(per)
      render json: @links
    end

    private

    def page
      params[:page] || 1
    end

    def per
      params[:per] || 24
    end
  end
end
