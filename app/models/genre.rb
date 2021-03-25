class Genre < ApplicationRecord
  
  has_many :products
  
  validates :name, presence: true
  
  def self.looks(searches, words)
    if searches == "perfect_match"
      @genre = Genre.where("name LIKE ?", "#{words}")
    else
      @genre = Genre.where("name LIKE ?", "%#{words}%")
    end
  end
end
