class User < ApplicationRecord
  include ActiveModel::ForbiddenAttributesProtection
  include ActiveModel::Serialization

  extend Textacular

  has_many :audios, foreign_key: 'uploader_id'

  self.primary_key = 'uid'

  def to_s
    "#<User uid:#{uid}, nickname: \"#{nickname}\">"
  end
end