class CreateActs < ActiveRecord::Migration[6.0]
  def change
    create_table :acts do |t|
      t.integer    :page,      null: false
      t.text       :content,   null: false
      t.text       :point,     null: false
      t.text       :act,       null: false
      t.references :book,      null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
