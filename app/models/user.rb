class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise :timeoutable, :trackable, :omniauthable, omniauth_providers: [:facebook]

  has_many :user_links
  has_many :links, through: :user_links

  # Instance Methods
  def like(link)
    likes.create(link: link)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, email: auth.info.email).first_or_create do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.uid = auth.info.uid
      # user.password = Devise.friendly_token[0,20]
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
        user.username = data['name'] if user.username.blank?
        user.provider = session['devise.facebook_data']['provider']
        user.uid = session['devise.facebook_data']['uid']
        user.valid?
      end
    end
  end
end
