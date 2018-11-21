ActiveAdmin.register Book do

	permit_params :title,:article_ids => []
	scope :all, :default => true

	index do
        selectable_column
        id_column
    	column :title do |book|
		link_to book.title, admin_book_path(book)
		end

		actions
		end
		filter :title
end
