module Api
  class LinksController < Api::BaseController
    def index
      @links = Link.includes(:users, :author).page(page).per_page(per_page).order(created_at: :desc)
      render json: @links
    end

    def create
      link = LinkService.new.update_or_create(params[:url], current_user)
      render json: link
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
