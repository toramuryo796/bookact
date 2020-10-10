class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string      :title,    null: false, default: ""
      t.string      :writer,   null: false, default: ""
      t.datetime    :publish,  null: false
      t.string      :company,  null: false, default: ""
      t.references  :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
