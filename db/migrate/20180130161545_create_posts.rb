class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    t.string      :title
    t.string      :content
    t.string      :photo
    t.integer     :rating, default: 0

    t.timestamps null: false
    end
  end
end
