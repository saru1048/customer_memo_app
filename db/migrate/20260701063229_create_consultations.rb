class CreateConsultations < ActiveRecord::Migration[8.1]
  def change
    create_table :consultations do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :consultation_type
      t.integer :status, null: false
      t.text :summary, null: false
      t.text :current_situation
      t.text :request
      t.text :proposal
      t.text :next_action
      t.date :next_action_due_on
      t.datetime :consulted_at, null: false

      t.timestamps
    end
  end
end
