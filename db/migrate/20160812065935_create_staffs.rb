class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string      :name
      t.string      :office
      t.integer     :order
      t.decimal     :wage
      t.date        :birthday
      t.date        :hire_date
      t.date  		:leaving_date

      t.timestamps
    end
    add_index :staffs, :name
  end
end
