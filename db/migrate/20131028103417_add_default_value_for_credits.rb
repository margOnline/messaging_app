class AddDefaultValueForCredits < ActiveRecord::Migration
  def up
    change_column :users, :credits, :integer, :default => 0
  end
end
