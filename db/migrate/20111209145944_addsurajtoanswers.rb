class Addsurajtoanswers < ActiveRecord::Migration
  def self.up
    def change
      add_column :answers, :suraj, :int
    end
  end

  def self.down
  end
end
