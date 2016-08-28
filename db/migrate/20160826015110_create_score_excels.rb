class CreateScoreExcels < ActiveRecord::Migration
  def change
    create_table :score_excels do |t|
      t.attachment :file
      t.timestamps null: false
    end
  end
end
