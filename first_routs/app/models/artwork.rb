# == Schema Information
#
# Table name: artworks
#
#  id        :bigint(8)        not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: 'User'

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

  has_many :shared_viewers,
    through: :artwork_shares,
    source:  :viewer

  has_many :comments, dependent: :destroy

  def self.artworks_for_user_id(user_id)
    Artwork.left_outer_joins(:artwork_shares).where('artworks.artist_id = :user_id OR artwork_shares.viewer_id = :user_id', user_id: user_id).distinct
  end
end
