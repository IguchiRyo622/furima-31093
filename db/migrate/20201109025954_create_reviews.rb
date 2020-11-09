class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :item_user, foreign_key: true
      t.text :review
      t.timestamps
    end
  end
end
