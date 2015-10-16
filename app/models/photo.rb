class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :album

  has_attached_file :image, default_url: "/images/medium/missing.png"
end
