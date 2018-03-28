class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :applies, :geeks, on_delete: :cascade, on_update: :cascade
    add_foreign_key :applies, :jobs, on_delete: :cascade, on_update: :cascade
    add_foreign_key :jobs, :companies, on_delete: :nullify, on_update: :cascade
  end
end
