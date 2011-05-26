class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :email
      
      t.integer :option 
      #t.integer :poll_id
      t.references :poll

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
