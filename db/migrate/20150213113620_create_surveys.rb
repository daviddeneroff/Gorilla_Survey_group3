class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :user
      t.integer :counter
      t.string :title
    end
  end
end
