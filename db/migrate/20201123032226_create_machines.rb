class CreateMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :machines do |t|
      t.string     :name,              null: false
      t.text       :detail,            null: false
      t.integer    :status_id,         null: false
      t.string     :time
      t.string     :subscriber
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end

