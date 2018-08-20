class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.integer :employee_id
      t.integer :office_id
    end
  end
end
