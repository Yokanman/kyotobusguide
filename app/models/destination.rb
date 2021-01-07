class Destination < ApplicationRecord
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :bus_stop
  belongs_to :line
  has_many :articles


  # def self.search(search)
  #   if search != ""
  #     Destination.joins(:articles).where('articles.detail LIKE(?)', "%#{search}%")
  #   else
  #     Destination.all
  #   end
  # end


  def self.search(search)
    if search != ""
      Article.where('detail LIKE(?)', "%#{search}%")
    else
      Destination.all
    end
  end

  # belongs_to :shipping_charger
  # belongs_to :shipping_from
  # belongs_to :days_to_shipping
  # belongs_to :user
  # has_one :order

  # with_options presence: true do
  #   validates :image
  #   validates :name
  #   validates :description
  #   validates :value,
  #             format: { with: /\A\d+\d\z/i, message: '半角数字で入力して下さい' },
  #             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300円以上9,999,999円以下で入力して下さい' }
  # end

  # with_options numericality: { other_than: 1, message: '項目を選択して下さい' } do
  #   validates :category_id
  #   validates :condition_id
  #   validates :shipping_charger_id
  #   validates :shipping_from_id
  #   validates :days_to_shipping_id
  # end
end
