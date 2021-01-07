class Article < ApplicationRecord

  belongs_to :destination
  belongs_to :user
  has_one_attached :image

  # validates :content, presence: true

  # def self.search(search)
  #   if search != ""
  #     Article.where('text LIKE(?)', "%#{search}%")
  #   else
  #     Article.all
  #   end
  # end

  # def save
    # article = Article.create(title: title, user_id: user_id, detail: detail, destination_id: destination_id)
  # end

end
