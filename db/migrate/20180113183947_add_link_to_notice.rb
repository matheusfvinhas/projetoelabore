class AddLinkToNotice < ActiveRecord::Migration[5.1]
  def change
    add_column :notices, :link, :string
  end
end
