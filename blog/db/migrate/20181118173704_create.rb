class Create < ActiveRecord::Migration[5.2]
  def change
  	#join table    #keys of both the active records
    create_join_table :books, :articles do |t|
    	t.index :book_id
    	t.index :article_id
  	end
  end
end
