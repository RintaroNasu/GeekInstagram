class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.datetime :start_time
      t.string :category
      t.integer :cost
      t.string :place
      t.timestamps
    end
  end
end
