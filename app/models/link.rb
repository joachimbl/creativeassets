class Link < ActiveRecord::Base
  has_many :user_links
  has_many :users, through: :user_links
  belongs_to :author, class_name: "User"
end
