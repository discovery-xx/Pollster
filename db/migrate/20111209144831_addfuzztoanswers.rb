class Addfuzztoanswers < ActiveRecord::Migration
  def self.up
    def change
      add_column :answers, :fuzz, :string
    end
  end

  def self.down
    remove_column :answers, :fuzz
  end
end
