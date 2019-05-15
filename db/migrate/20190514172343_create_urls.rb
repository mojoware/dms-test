class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.references :email, index: true
      t.string :short_url
      t.string :long_url

      t.timestamps
    end
  end
end
