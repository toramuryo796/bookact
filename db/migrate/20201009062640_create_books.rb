class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string      :title,    null: false
      t.string      :writer,   null: false
      t.date        :publish,  null: false
      t.string      :company,  null: false
      t.references  :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
