class AddColumnToCustomer < ActiveRecord::Migration[6.1]
  def change

    add_column :customers, :first_name, :string, null: false, default: ''
    add_column :customers, :last_name, :string, null: false, default: ''
    add_column :customers, :first_name_kana, :string, null: false, default: ''
    add_column :customers, :last_name_kana, :string, null: false, default: ''
    add_column :customers, :zip_code, :string, null: false, default: ''
    add_column :customers, :address, :string, null: false, default: ''
    add_column :customers, :telphone_number, :string, null: false, default: ''
  end
end
