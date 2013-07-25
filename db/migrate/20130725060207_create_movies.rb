class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :year

      t.timestamps
    end
  end
end
