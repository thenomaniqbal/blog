ActiveAdmin.register Article do

	permit_params :title,:text, :image, :user_id, :book_ids => []
	scope :all, :default => true
	filter :title

	index do
		selectable_column
        id_column
		column :title do |article|
		link_to article.title, admin_article_path(article)
		end

		column :created_at
		column :text
		column :image_file_name
		column :image_content_type
		actions
		end

	    
end
