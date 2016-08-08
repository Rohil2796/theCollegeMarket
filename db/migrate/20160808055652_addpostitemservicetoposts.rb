class Addpostitemservicetoposts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :postitemservice, :integer
  end
end
