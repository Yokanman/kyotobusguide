class CreateDestinationArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :destination_articles do |t|
      t.references :destination, foreign_key: true
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
