class CreateGlobalEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :global_events do |t|
      t.string :title
      t.string :note
      t.string :hour
      t.datetime :day
      t.integer :user_id

      t.timestamps
    end
  end
end
