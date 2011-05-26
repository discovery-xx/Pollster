class CreatePolls < ActiveRecord::Migration
  def self.up
    create_table :polls do |t|
      t.string :question
      t.string :option1
      t.string :option2
      t.string :option3
      t.integer :option1count,   :default => 0     
      t.integer :option2count,   :default => 0
      t.integer :option3count,   :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :polls
  end
end
