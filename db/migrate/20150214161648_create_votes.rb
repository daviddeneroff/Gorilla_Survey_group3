class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :possible_choice
    end
  end
end
