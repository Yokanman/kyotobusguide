class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search)
    if search != ""
      Article.where('detail LIKE(?)', "%#{search}%")
    else
      Destination.all
    end
  end


end



