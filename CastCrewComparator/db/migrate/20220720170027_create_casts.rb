class CreateCasts < ActiveRecord::Migration[7.0]
  def change
    create_table :casts do |t|
      t.string :first_person
      t.string :second_person

      t.timestamps
    end
  end
end
