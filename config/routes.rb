Rails.application.routes.draw do
  scope module: :frontend do
    root 'frontpage#show'
  end

end
