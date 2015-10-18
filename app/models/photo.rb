class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :album

  has_attached_file :image, styles: { medium: "300x300>"}, default_url: "/images/medium/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
