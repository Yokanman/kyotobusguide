class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text    :title, null: false
      t.references :user, foreign_key: true
      t.text    :detail, null: false
      t.references :destination, foreign_key: true


      t.timestamps
    end
  end
end
