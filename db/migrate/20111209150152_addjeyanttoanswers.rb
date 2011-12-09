class Addjeyanttoanswers < ActiveRecord::Migration
  def self.up
    def change
      add_column :answers, :jeyant, :string
    end
  end

  def self.down
  end
end
