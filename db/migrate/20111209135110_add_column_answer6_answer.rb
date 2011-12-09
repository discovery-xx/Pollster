class AddColumnOption6Answer < ActiveRecord::Migration
  def self.up
    add_column :answers, :answer6, :int
  end

  def self.down
    remove_column :answers, :answer6
  end
end
