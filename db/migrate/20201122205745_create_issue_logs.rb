class CreateIssueLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :issue_logs do |t|
      t.integer :old_status
      t.integer :new_status
      t.integer :initiating_user_id
      t.integer :time_spent
      t.references :project, foreign_key: true
      t.references :issue, foreign_key: true
    end
  end
end
