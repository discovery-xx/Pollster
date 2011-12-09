class AddOption4ToAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :option4, :string
  end

  def self.down
    remove_column :answers, :option4, :string
  end
end
