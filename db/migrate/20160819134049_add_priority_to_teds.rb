class AddPriorityToTeds < ActiveRecord::Migration[5.0]
  def change
    add_column :teds, :priority, :string
  end
end
