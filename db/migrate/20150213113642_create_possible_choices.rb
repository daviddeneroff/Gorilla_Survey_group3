class CreatePossibleChoices < ActiveRecord::Migration
  def change
    create_table :possible_choices do |t|
      t.references :question
      t.references :survey
      t.string :content
    end
  end
end
