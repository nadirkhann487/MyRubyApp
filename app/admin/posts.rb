ActiveAdmin.register Post do
  permit_params :name,:body,:created_at,:admin_user_id
  menu :label => "Blog Posts"
  index do
    column :name
    column "Author",:admin_user
    column :category
    column :created_at
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :body, :category_id, :author_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :body, :category_id, :author_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
