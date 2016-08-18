class CreateTeds < ActiveRecord::Migration[5.0]
  def change
    create_table :teds do |t|
      t.string :name
      t.string :place
      t.string :type
      t.string :theme
      t.datetime :event_date
      t.datetime :submission_deadline
      t.string :organizers
      t.string :contact
      t.string :submission
      t.text :notes
      t.string :status

      t.timestamps
    end
  end
end
