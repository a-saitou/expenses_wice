class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer      :calendar_id
      t.integer	     :staff_id
      t.integer      :agreement_id
      t.time         :start_time
      t.time         :end_time
      t.integer      :work_time
      t.integer      :over_time
      t.integer      :late_night_over_time
      t.integer      :paid_holiday
      t.integer      :agency_holiday
      t.timestamps
    end
   add_index :works, :calendar_id
   add_index :works, :staff_id
   add_index :works, :agreement_id
  end
end
