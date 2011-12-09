class Addflagtoanswers < ActiveRecord::Migration
  def self.up
    def change
      add_column :answers, :flag, :int
    end
  end

  def self.down
    remove_column :answers, :flag
  end
end
