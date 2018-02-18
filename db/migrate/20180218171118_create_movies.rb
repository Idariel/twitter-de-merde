class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.name :
      t.date :
      t.director :
      t.image :

      t.timestamps
    end
  end
end
