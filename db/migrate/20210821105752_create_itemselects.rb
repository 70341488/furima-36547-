class CreateItemselects < ActiveRecord::Migration[6.0]
  def change
    create_table :itemselects do |t|

      t.timestamps
    end
  end
end
