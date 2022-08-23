class CreateCcInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :cc_infos do |t|
      t.string :name
      t.string :picture
      t.string :knownFor

      t.timestamps
    end
  end
end
